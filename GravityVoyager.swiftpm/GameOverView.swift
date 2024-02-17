import SwiftUI

/// The view responsible for displaying the Game Over screen.
struct GameOverView: View {
    
    /// The router manager for handling navigation within the app.
    @EnvironmentObject private var routeManager: NavigationRouter
    
    /// The type of planet associated with the game over screen
    let planet: PlanetType
    
    var body: some View {
        ZStack {
            Image("backgroundGradient")
                .resizable()
                .ignoresSafeArea()
            VStack(spacing: 20){
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .foregroundColor(.theme.secondary)
                    VStack(spacing: 26){
                        Text("Almost there!")
                            .font(.system(size: 28, weight: .bold))
                            .foregroundColor(.white)
                        Text("Something went wrong in your mission, return to the ship to recalibrate your equipment and try again!")
                            .font(.system(size: 20, weight: .regular))
                            .foregroundColor(.white)
                        Image("gearIllustration")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                    }
                    .padding(16)
                }
                Spacer()
                PrimaryButton(title: "Try Again") {
                    routeManager.push(to: .tutorialView(planet: planet))
                }
                SecondaryButton(title: "Main Menu") {
                    routeManager.popToRoot()
                }
            }
            .padding(20)
            .multilineTextAlignment(.center)
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct GameOverView_Previews: PreviewProvider {
    static var previews: some View {
        GameOverView(planet: dev.mockPlanet)
    }
}
