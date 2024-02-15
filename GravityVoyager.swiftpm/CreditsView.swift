import Foundation
import SwiftUI

// todo: design this screen
struct CreditsView: View {
    @EnvironmentObject private var routeManager: NavigationRouter
    var body: some View {
        ZStack{
            Image("backgroundGradient")
                .resizable()
                .ignoresSafeArea()
            VStack(spacing: 10){
                ScrollView{
                    VStack(spacing: 20){
                        Text("Sound Effects")
                            .foregroundColor(.white)
                            .font(.system(size: 22, weight: .bold))
                        CreditsContainer(headerName: "Collect Sound", source: "FreeSound", url: "https://freesound.org/people/MATRIXXX_/sounds/523547/", author: "MATRIXXX_")
                        CreditsContainer(headerName: "Neutralize Sound", source: "fulano", url: "https://freesound.org/people/deathbyfairydust/sounds/658431/", author: "debyfairydust")
                        CreditsContainer(headerName: "Fail Sound", source: "fulano", url: "https://freesound.org/people/jugraf/sounds/370209/", author: "jugraf")
                        Text("Source of information")
                            .foregroundColor(.white)
                            .font(.system(size: 22, weight: .bold))
                        CreditsContainer(headerName: "Moon information", source: "Nasa", url: "https://freesound.org/people/MATRIXXX_/sounds/523547/", author: "junior")
                        CreditsContainer(headerName: "Mars information", source: "Nasa", url: "https://freesound.org/people/MATRIXXX_/sounds/523547/", author: "junior")
                        CreditsContainer(headerName: "Components information", source: "Nasa", url: "https://freesound.org/people/MATRIXXX_/sounds/523547/", author: "junior")
                        CreditsContainer(headerName: "Components information", source: "Nasa", url: "https://freesound.org/people/MATRIXXX_/sounds/523547/", author: "junior")
                    }
                }
                Spacer()
                PrimaryButton(title: "Ok") {
                    routeManager.popToRoot()
                }
            }
            .padding(20)
        }
        .navigationTitle("Credits")
    }
}

struct CreditsContainer: View {
    let headerName: String
    let source: String
    let url: String
    let author: String
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .foregroundColor(Color.theme.secondary)
            VStack(alignment: .leading, spacing: 8){
                Text(headerName)
                    .font(.system(size: 22, weight: .semibold))
                HStack {
                    Text("Source:")
                        .font(.system(size: 16, weight: .regular))
                    Spacer()
                    Link(source, destination: URL(string: url) ?? URL(string: "https://www.google.com/")!)
                        .underline()
                        .font(.system(size: 16, weight: .regular))
                        .multilineTextAlignment(.trailing)
                }
                HStack {
                    Text("Author:")
                        .font(.system(size: 16, weight: .regular))
                    Spacer()
                    Text(author)
                        .font(.system(size: 16, weight: .regular))
                }
            }
            .padding(16)
            .foregroundColor(.white)
        }
    }
}

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
    }
}

