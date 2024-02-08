import ARKit
import RealityKit
import SwiftUI
import Combine

// MARK: Custom ARKit view controller for handling the game logic and rendering.

class GameViewController: UIViewController, ARSCNViewDelegate {
    
    var gameLogicDelegate: GameLogicDelegate? = nil
    var planetType: PlanetType?
    var sceneView: ARSCNView!
    var player: AVAudioPlayer!
    private var cancellables: Set<AnyCancellable> = []
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupARView()
        subscribeToActionStream()
        addRandomElements()
        addRandomElements()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        sceneView.frame = view.bounds
        self.configureSession()
    }
    
    func setupARView() {
        sceneView = ARSCNView()
        sceneView.delegate = self
        view.addSubview(sceneView)
        sceneView.scene = SCNScene()
        sceneView.scene.physicsWorld.contactDelegate = self
    }
    
    func addRandomElements() {
        let numberOfElements = Int.random(in: 1...5)
        for _ in 1...numberOfElements {
            let randomType: ElementType = Bool.random() ? .neutralizable : .collectable
            addNewElement(type: randomType)
        }
    }
    
    // MARK: Combine
    /// Subscribes to the ARManager's actions stream to handle different AR actions.
    func subscribeToActionStream(){
        ARManager.shared.actionsStream
            .sink { [weak self] action in
                switch action {
                case .collect:
                    self?.activateRay(type: .collect)
                case .neutralize:
                    self?.activateRay(type: .neutralize)
                case .pause:
                    self?.sceneView.session.pause()
                case .play:
                    self?.sceneView.session.run(ARWorldTrackingConfiguration())
                }
            }
            .store(in: &cancellables)
    }
}

// MARK: Game Functionality

extension GameViewController {
    
    /// Configures the AR session based on device capabilities.
    func configureSession() {
        if ARWorldTrackingConfiguration.isSupported {
            let configuration = ARWorldTrackingConfiguration()
            configuration.planeDetection = ARWorldTrackingConfiguration.PlaneDetection.horizontal
            sceneView.session.run(configuration)
        } else {
            // less immersive AR experience due to lower end processor
            let configuration = AROrientationTrackingConfiguration()
            sceneView.session.run(configuration)
        }
    }
    
    /// Retrieves the user's direction and position in the AR world.
    func getUserVector() -> (SCNVector3, SCNVector3) {
        if let frame = self.sceneView.session.currentFrame {
            // 4x4 transform matrix describing camera in world space
            let mat = SCNMatrix4(frame.camera.transform)
            // orientation of camera in world space
            let dir = SCNVector3(-1 * mat.m31, -1 * mat.m32, -1 * mat.m33)
            // location of camera in world space
            let pos = SCNVector3(mat.m41, mat.m42, mat.m43)
            return (dir, pos)
        }
        return (SCNVector3(0, 0, -1), SCNVector3(0, 0, -0.2))
    }
    
    /// Throws the choosen ray and plays a sound in the scene.
    func activateRay(type: RayType) {
        let rayNode: SCNNode
        switch type {
        case .collect:
            rayNode = CollectRay()
        case .neutralize:
            rayNode = NeutralizeRay()
        }
        //SoundManager.shared.playSound(sound: .throwDart)
        let (direction, position) = self.getUserVector()
        rayNode.position = position
        let rayDirection = direction
        rayNode.physicsBody?.applyForce(rayDirection, asImpulse: true)
        sceneView.scene.rootNode.addChildNode(rayNode)
    }
    
    /// Generates a random float between the given upper and lower bounds.
    func floatBetween(_ first: Float,  and second: Float) -> Float {
        return (Float(arc4random()) / Float(UInt32.max)) * (first - second) + second
    }
    
    // TODO: Find a better range
    /// Adds a new element to the scene at a random position.
    func addNewElement(type: ElementType) {
        let elementNode: SCNNode
        switch type {
        case .collectable:
            elementNode = CollectableElement(type: planetType!)
        case .neutralizable:
            elementNode = NeutralizableElement(type: planetType!)
        }
        let posX = floatBetween(-1.5, and: 2.5)
        let posY = floatBetween(-1.5, and: 1.5)
        let posZ = floatBetween(-2.0, and: -1.0)
        elementNode.position = SCNVector3(posX, posY, posZ)
        sceneView.scene.rootNode.addChildNode(elementNode)
    }
    
    /// Removes a node from the scene
    func removeAndReplaceNodes(contact: SCNPhysicsContact) {
        contact.nodeB.removeFromParentNode()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            contact.nodeA.removeFromParentNode()
            self.addRandomElements()
        }
    }
}

// MARK: Delegate

extension GameViewController {
    
    /// Handles adding collectable points through the game logic delegate.
    func addCollectablePoint() {
        if var gameLogicDelegate = self.gameLogicDelegate {
            DispatchQueue.main.async {
                gameLogicDelegate.addCollectablePoint()
            }
        }
    }
    
    /// Handles adding neutralizable points through the game logic delegate.
    func addNeutralizablePoint() {
        if var gameLogicDelegate = self.gameLogicDelegate {
            DispatchQueue.main.async {
                gameLogicDelegate.addNeutralizablePoint()
            }
        }
    }
    
    func gameOver() {
        if var gameLogicDelegate = self.gameLogicDelegate {
            DispatchQueue.main.async {
                gameLogicDelegate.gameOver()
            }
        }
    }
}

// MARK: Collisions

extension GameViewController: SCNPhysicsContactDelegate {
    
    /// Called when a physics contact occurs in the scene.
    func physicsWorld(_ world: SCNPhysicsWorld, didBegin contact: SCNPhysicsContact) {
        guard let categoryA = contact.nodeA.physicsBody?.categoryBitMask,
              let categoryB = contact.nodeB.physicsBody?.categoryBitMask else {
            return
        }
        switch (categoryA, categoryB) {
            //MARK: CollectableRay and CollectableElement
        case (CollisionCategory.collectRay, CollisionCategory.collectableElement),
            (CollisionCategory.collectableElement, CollisionCategory.collectRay):
            handleCollision(contact: contact, type: .collectable)
            //MARK: NeutralizeRay and CollectableElement
        case (CollisionCategory.neutralizeRay, CollisionCategory.neutralizableElement),
            (CollisionCategory.neutralizableElement, CollisionCategory.neutralizeRay):
            handleCollision(contact: contact, type: .neutralizable)
        default:
            removeAndReplaceNodes(contact: contact)
            gameOver()
        }
    }
    
    func handleCollision(contact: SCNPhysicsContact, type: ElementType) {
        removeAndReplaceNodes(contact: contact)
        HapticManager.shared.impact()
        switch type {
        case .collectable:
            addCollectablePoint()
        case .neutralizable:
            addNeutralizablePoint()
        }
    }
}
