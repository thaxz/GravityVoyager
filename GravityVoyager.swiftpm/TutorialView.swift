import Foundation
import SwiftUI

struct TutorialView: View {
    /// The router manager for handling navigation within the app.
    @EnvironmentObject private var routeManager: NavigationRouter
    
    let planet: PlanetType
    
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
            VStack(spacing: 20){
                Spacer()
                PrimaryButton(title: "Ok!") {
                    routeManager.push(to: .gameView(planet: planet))
                }
            }
            .padding(20)
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct TutorialView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialView(planet: dev.mockPlanet)
    }
}
