import SwiftUI

/// The home view of the application.
struct HomeView: View {
    
    /// The router manager for handling navigation within the app.
    @StateObject private var routeManager = NavigationRouter()
    /// The view model managing game logic and data
    @StateObject private var viewModel = GameViewModel.shared
    
    var body: some View {
        NavigationStack(path: $routeManager.routes){
            ZStack {
                Image("homeBackground")
                    .resizable()
                    .ignoresSafeArea()
                VStack(spacing: 20){
                    Spacer()
                    PrimaryButton(title: "Play") {
                        routeManager.push(to: .levelsView)
                    }
                    SecondaryButton(title: "Credits") {
                        routeManager.push(to: .creditsView)
                    }
                }
                .padding(20)
            }
            .navigationDestination(for: Route.self) { route in
                route
            }
        }
        .environmentObject(routeManager)
        .environmentObject(viewModel)
    }
}
