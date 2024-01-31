import SwiftUI

// MARK: Manager class to control Navigation
final class NavigationRouter: ObservableObject {
    
    @Published var routes: [Route] = []
    
    /// Pushing to any view that is inside of Route enum
    func push(to screen: Route){
        routes.append(screen)
    }
    
    /// Pushes back to root (HomeView)
    func popToRoot(){
        routes = []
    }
    
    /// Pushes back one view
    func popToLast(){
        _ = routes.popLast()
    }
    
}
