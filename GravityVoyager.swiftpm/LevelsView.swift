import Foundation
import SwiftUI

struct LevelsView: View {
    /// The router manager for handling navigation within the app.
    @EnvironmentObject private var routeManager: NavigationRouter
    @EnvironmentObject private var viewModel: GameViewModel
    var body: some View {
        ZStack {
            Image("backgroundGradient")
                .resizable()
                .ignoresSafeArea()
            VStack(spacing: 50){
                Image("moonButton")
                    .onTapGesture {
                        viewModel.selectedPlanet = .moon
                        routeManager.push(to: .dialogueView(planet: .moon))
                    }
                Image("marsButton")
                    .onTapGesture {
                        viewModel.selectedPlanet = .mars
                        routeManager.push(to: .dialogueView(planet: .mars))
                    }
            }
            .padding(32)
        }
    }
}

struct LevelsView_Previews: PreviewProvider {
    static var previews: some View {
        LevelsView()
    }
}
