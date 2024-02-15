import Foundation
import SwiftUI

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
                        CreditsContainer(headerName: "Neutralize Sound", source: "FreeSound", url: "https://freesound.org/people/deathbyfairydust/sounds/658431/", author: "debyfairydust")
                        CreditsContainer(headerName: "Fail Sound", source: "FreeSound", url: "https://freesound.org/people/jugraf/sounds/370209/", author: "jugraf")
                        Text("Source of information")
                            .foregroundColor(.white)
                            .font(.system(size: 22, weight: .bold))
                        CreditsContainer(headerName: "Moon Information", source: "Nasa", url: "https://science.nasa.gov/moon/", author: "SMD Content Editors")
                        CreditsContainer(headerName: "Moon Composition", source: "Nasa", url: "https://science.nasa.gov/moon/composition/", author: "Andrea Jones, Science Advisor")
                        CreditsContainer(headerName: "Moon Formation", source: "Nasa", url: "science.nasa.gov/moon/formation/", author: "Prabal Saxena, Sarah Valencia and Bill Bottke")
                        CreditsContainer(headerName: "Mars Information", source: "Nasa", url: "https://science.nasa.gov/mars/", author: "SMD Content Editors")
                        CreditsContainer(headerName: "Mars Composition", source: "Nasa", url: "https://science.nasa.gov/mars/facts/", author: "Andrea Jones, Science Advisor")
                        CreditsContainer(headerName: "Mars Atmosphere", source: "Arizona State University", url: "https://marsed.asu.edu/mep/atmosphere", author: "Sheri Klug")
                    }
                }
                Spacer()
                PrimaryButton(title: "Ok") {
                    routeManager.popToRoot()
                }
            }
            .multilineTextAlignment(.trailing)
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
                    .font(.system(size: 22, weight: .bold))
                HStack {
                    Text("Source:")
                        .font(.system(size: 16, weight: .medium))
                    Spacer()
                    Text(source)
                        .font(.system(size: 16, weight: .regular))
                        .multilineTextAlignment(.trailing)
                }
                HStack {
                    Text("Author:")
                        .font(.system(size: 16, weight: .medium))
                    Spacer()
                    Text(author)
                        .font(.system(size: 16, weight: .regular))
                }
                HStack {
                    Text("Link:")
                        .font(.system(size: 16, weight: .medium))
                    Spacer()
                    Text(url)
                        .font(.system(size: 12, weight: .regular))
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

