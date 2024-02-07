import Foundation
import SwiftUI

// todo: design this screen
struct CreditsView: View {
    @EnvironmentObject private var routeManager: NavigationRouter
    var body: some View {
        ZStack {
            Image("backgroundGradient")
                .resizable()
                .ignoresSafeArea()
            VStack(spacing: 20){
                Spacer()
                SecondaryButton(title: "Ok") {
                    routeManager.popToRoot()
                }
            }
            .padding(20)
        }
    }
}

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
    }
}

