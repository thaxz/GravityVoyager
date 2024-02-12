import SwiftUI
//todo: limpar o body criar uma extensão e colocar os componentes

struct GameOverView: View {
    /// The router manager for handling navigation within the app.
    @EnvironmentObject private var routeManager: NavigationRouter
    
    let planet: PlanetType
    
    var body: some View {
        ZStack {
            Image("backgroundGradient")
                .resizable()
                .ignoresSafeArea()
            VStack(spacing: 20){
                Text("Hurry up!")
                    .font(.system(size: 36, weight: .bold))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .foregroundColor(.theme.secondary)
                    VStack(spacing: 26){
                        Text("Eita!")
                            .font(.system(size: 28, weight: .bold))
                            .foregroundColor(.white)
                        Text("Você não conseguiu pegar todos os componentes necessários a tempo e teve que retornar para sua nave!")
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
