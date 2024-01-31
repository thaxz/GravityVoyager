import SwiftUI

import Foundation
import Combine
import RealityKit

// Manager class to control AR-related actions
class ARManager {
    
    /// Singleton
    static let shared = ARManager()
    private init () {}
    
    /// PassthroughSubject object used to publish AR actions to any object that subscribed to it
    var actionsStream = PassthroughSubject<ARAction, Never>()
}

// MARK: Enum to represent all possible AR actions

enum ARAction {
    
    case collect
    case neutralize
    case pause
    case play
}

// MARK: Collision categories for physics interactions

struct CollisionCategory {
    
    /// Rays
    static let collectRay: Int = Int(2)
    static let neutralizeRay: Int = Int(4)
    /// Elements
    static let collectableElement: Int = Int(8)
    static let neutralizableElement: Int = Int(16)
}
