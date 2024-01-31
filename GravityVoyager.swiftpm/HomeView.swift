import SwiftUI

struct HomeView: View {
    /// The router manager for handling navigation within the app.
    @StateObject private var routeManager = NavigationRouter()
    @StateObject private var viewModel = GameViewModel.shared
    var body: some View {
        NavigationStack(path: $routeManager.routes){
            ZStack {
                Color.theme.background
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
