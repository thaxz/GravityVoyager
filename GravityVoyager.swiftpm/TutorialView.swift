import Foundation
import SwiftUI

/// A view displaying the tutorial for playing the game
struct TutorialView: View {
    
    /// The router manager for handling navigation within the app.
    @EnvironmentObject private var routeManager: NavigationRouter
    let planet: PlanetType
    
    var body: some View {
        ZStack {
            Image("backgroundGradient")
                .resizable()
                .ignoresSafeArea()
            Image("defaultBackground")
                .resizable()
                .ignoresSafeArea()
            VStack(spacing: 20){
                Text("How To Play")
                    .foregroundColor(.white)
                    .font(.system(size: 32, weight: .bold))
                ScrollView{
                    VStack(spacing: 12){
                        headerText
                        collectableSection
                        neutralizableSection
                        footerText
                    }
                }
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

// MARK: Components

extension TutorialView {
    
    var headerText: some View {
        RoundedRectangle(cornerRadius: 32)
            .frame(height: 170)
            .foregroundColor(.theme.terciary.opacity(0.70))
            .overlay(
                Text("This is an AR Shooter Game. Explore your surroundings to discover floating elements. When you find an element, aim and tap the corresponding buttons to release the projectiles.")
                    .foregroundColor(.white)
                    .font(.system(size: 18, weight: .medium))
                    .padding(.horizontal, 16)
            )
    }
    
    var collectableSection: some View{
        RoundedRectangle(cornerRadius: 32)
            .frame(height: 170)
            .foregroundColor(.theme.terciary.opacity(0.70))
            .overlay(
                HStack{
                    Image("collectIcon")
                        .resizable()
                        .scaledToFit()
                    Text("This is a collectible element. Press the 'Collect' button to gather it for your report.")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .medium))
                    
                }
                    .padding(16)
            )
    }
    
    var neutralizableSection: some View{
        RoundedRectangle(cornerRadius: 32)
            .frame(height: 170)
            .foregroundColor(.theme.terciary.opacity(0.70))
            .overlay(
                HStack{
                    Text("This is a neutralizable element. Press the 'Neutralize' button to eliminate it.")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .medium))
                    Image("neutralizeIcon")
                        .resizable()
                        .scaledToFit()
                }
                    .padding(20)
            )
    }
    
    var footerText: some View {
        RoundedRectangle(cornerRadius: 32)
            .frame(height: 120)
            .foregroundColor(.theme.terciary.opacity(0.70))
            .overlay(
                Text("Collect the required amount of each element within the available time to complete your mission. Good luck!")
                    .foregroundColor(.white)
                    .font(.system(size: 18, weight: .medium))
                    .padding(.horizontal, 16)
            )
    }
    
}

struct TutorialView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialView(planet: dev.mockPlanet)
    }
}
