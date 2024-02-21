import SwiftUI
import Foundation
import SceneKit
import UIKit

/// Enum that represents the available ray types
enum RayType {
    case collect
    case neutralize
}

/// Enum that represents the available element types
enum ElementType {
    case collectable
    case neutralizable
}

/// Class that creates the collectable ray
class CollectRay: SCNNode {
    override init () {
        super.init()
        /// Creating geometry
        let cone = SCNCone(topRadius: 0.00, bottomRadius: 0.025, height: 0.020)
        self.geometry = cone
        /// Creating physics shape
        let shape = SCNPhysicsShape(geometry: cone, options: nil)
        self.physicsBody = SCNPhysicsBody(type: .dynamic, shape: shape)
        self.physicsBody?.isAffectedByGravity = false
        /// Setting collision bitmasks
        self.physicsBody?.categoryBitMask = CollisionCategory.collectRay
        self.physicsBody?.collisionBitMask = CollisionCategory.collectableElement | CollisionCategory.neutralizableElement
        self.physicsBody?.contactTestBitMask = CollisionCategory.collectableElement | CollisionCategory.neutralizableElement
        let material = SCNMaterial()
        material.diffuse.contents = UIImage(named: "collectIcon")
        self.geometry?.materials  = [material]
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

/// Class that creates the neutralizable ray
class NeutralizeRay: SCNNode {
    override init () {
        super.init()
        /// Creating geometry
        let cone = SCNCone(topRadius: 0.0, bottomRadius: 0.035, height: 0.030)
        self.geometry = cone
        /// Creating physics shape
        let shape = SCNPhysicsShape(geometry: cone, options: nil)
        self.physicsBody = SCNPhysicsBody(type: .dynamic, shape: shape)
        self.physicsBody?.isAffectedByGravity = false
        /// Setting collision bitmasks
        self.physicsBody?.categoryBitMask = CollisionCategory.neutralizeRay // Applying Dart BitMask
        self.physicsBody?.contactTestBitMask = CollisionCategory.collectableElement | CollisionCategory.neutralizableElement // Bitmask of what is going to collide with
        let material = SCNMaterial()
        material.diffuse.contents = Color.black
        material.diffuse.contents = UIImage(named: "neutralizeIcon")
        self.geometry?.materials  = [material]
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

/// Class responsible for creating a floating collectable element that randomly appears in the scene.
class CollectableElement: SCNNode {
    let type: PlanetType
    let imageName: String
    init(type: PlanetType) {
        self.type = type
        switch type {
        case .moon:
            self.imageName = "collectMoon"
        case .mars:
            self.imageName = "collectMars"
        }
        super.init()
        /// Creating geometry
        let box = SCNBox(width: 0.25, height: 0.25, length: 0.0, chamferRadius: 0)
        self.geometry = box
        /// Creating physics shape
        let shape = SCNPhysicsShape(geometry: box, options: nil)
        self.physicsBody = SCNPhysicsBody(type: .dynamic, shape: shape)
        self.physicsBody?.isAffectedByGravity = false
        /// Setting collision bitmasks
        self.physicsBody?.categoryBitMask = CollisionCategory.collectableElement
        self.physicsBody?.contactTestBitMask = CollisionCategory.collectRay | CollisionCategory.neutralizeRay
        self.physicsBody?.collisionBitMask = CollisionCategory.collectRay | CollisionCategory.neutralizeRay
        let material = SCNMaterial()
        let randomNumber: Int = Int.random(in: 1...3)
        material.diffuse.contents = UIImage(named: "\(imageName)\(randomNumber)")
        self.geometry?.materials  = [material]
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//// Class responsible for creating a floating neutralizable element that randomly appears in the scene.
class NeutralizableElement: SCNNode {
    let type: PlanetType
    let imageName: String
    init(type: PlanetType) {
        self.type = type
        switch type {
        case .moon:
            self.imageName = "neutralizeMoon"
        case .mars:
            self.imageName = "neutralizeMars"
        }
        super.init()
        /// Creating geometry
        let box = SCNBox(width: 0.25, height: 0.25, length: 0.0, chamferRadius: 0)
        self.geometry = box
        /// Creating physics shape
        let shape = SCNPhysicsShape(geometry: box, options: nil)
        self.physicsBody = SCNPhysicsBody(type: .dynamic, shape: shape)
        self.physicsBody?.isAffectedByGravity = false
        /// Setting collision bitmasks
        self.physicsBody?.categoryBitMask = CollisionCategory.neutralizableElement // Applying Board BitMask
        self.physicsBody?.contactTestBitMask = CollisionCategory.neutralizeRay | CollisionCategory.collectRay // Bitmask of what is going to collide with
        let material = SCNMaterial()
        let randomNumber: Int = Int.random(in: 1...2)
        material.diffuse.contents = UIImage(named: "\(imageName)\(randomNumber)")
        self.geometry?.materials  = [material]
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }    
}
