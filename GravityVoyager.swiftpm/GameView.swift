import Foundation
import SwiftUI

/// The view that hosts the game according to the chosen planet
struct GameView: View {
    
    /// The router manager for handling navigation within the app
    @EnvironmentObject private var routeManager: NavigationRouter
    /// The view model responsible for managing the game
    @EnvironmentObject private var viewModel: GameViewModel
    /// The type of planet of the game 
    let planet: PlanetType
    
    var body: some View {
        ZStack {
            ARViewContainer(delegate: viewModel)
                .ignoresSafeArea()
            VStack(spacing: 20){
                HStack{
                    Spacer()
                    TimeContainer(time: viewModel.secondsRemaining)
                    Spacer()
                    pauseSection
                }
                scoreSection
                Spacer()
                HStack(spacing: 20){
                    PrimaryButton(title: "Catch") {
                        ARManager.shared.actionsStream.send(.collect)
                    }
                    SecondaryButton(title: "Neutralize") {
                        ARManager.shared.actionsStream.send(.neutralize)
                    }
                }
            }
            .padding(20)
            if viewModel.isPaused {
                PauseView {
                    viewModel.isPaused = false
                    viewModel.returnGame()
                }
            }
        }
        .onAppear{
            viewModel.setupGame()
        }
        .navigationBarBackButtonHidden(true)
        .onChange(of: viewModel.isGameOver) { newValue in
            routeManager.push(to: .gameOverView(planet: planet))
        }
        .onChange(of: viewModel.isVictory) { newValue in
            routeManager.push(to: .winView(planet: planet))
        }
    }
}

// MARK: Components

extension GameView {
    
    var pauseSection: some View {
        Image(systemName: "pause.fill")
            .resizable()
            .frame(width: 30, height: 30)
            .foregroundColor(.white)
            .onTapGesture {
                viewModel.isPaused = true
                viewModel.pauseGame()
            }
    }
    
    var scoreSection: some View {
        HStack(){
            Image("collectIcon")
                .resizable()
                .frame(width: 25, height: 25)
                .foregroundColor(.white)
            Text("\(viewModel.collectableScore)/\(viewModel.collectableNeeded)")
                .font(.system(size: 22, weight: .bold))
                .foregroundColor(.white)
            Spacer()
            Image("neutralizeIcon")
                .resizable()
                .frame(width: 25, height: 25)
                .foregroundColor(.white)
            Text("\(viewModel.neutralizableScore)/\(viewModel.neutralizableNeeded)")
                .font(.system(size: 22, weight: .bold))
                .foregroundColor(.white)
        }
        .padding(.horizontal, 50)
    }
    
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(planet: dev.mockPlanet)
    }
}
