import SwiftUI

/// Manager class responsible for controlling navigation within the app
final class NavigationRouter: ObservableObject {
    
    /// Array containing the navigation route stack
    @Published var routes: [Route] = []
    
    /// Pushes a new view onto the navigation stack.
    /// - Parameter screen: The destination view to be pushed onto the stack.
    func push(to screen: Route){
        routes.append(screen)
    }
    
    /// Pops back to the root view (HomeView).
    func popToRoot(){
        routes = []
    }
    
    /// Pops back to the last view in the stack.
    func popToLast(){
        _ = routes.popLast()
    }
    
}
