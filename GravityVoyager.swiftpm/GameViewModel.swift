import Foundation
import Combine

// MARK: A protocol defining score operations.
protocol GameLogicDelegate {
    
    mutating func addCollectablePoint() -> Void
    mutating func addNeutralizablePoint() -> Void
    mutating func gameOver() -> Void
    
}

// MARK: View model for managing game logic and data in the App
class GameViewModel: ObservableObject, GameLogicDelegate {
    
    static let shared = GameViewModel()
    private init () {}
    
    private var cancellables: Set<AnyCancellable> = []
    
    @Published var selectedPlanet: PlanetType = .moon
    
    @Published var isPaused: Bool = false
    @Published var isGameOver: Bool = false
    @Published var isVictory: Bool = false
    
    @Published var secondsRemaining = 00
    @Published var secondsNeeded: Int = 00
    @Published var collectableScore: Int = 0
    @Published var neutralizableScore: Int = 0
    
    var collectableNeeded = 8
    var neutralizableNeeded = 6
    
    var timerPausedDate: Date?
    var gameTimer: Timer?
    var startTime: Date? = nil
    private var pausedTime: Date?
    
    // MARK: Protocol
    
    func addCollectablePoint() {
        collectableScore += 1
        checkScore()
    }
    
    func addNeutralizablePoint() {
        neutralizableScore += 1
        checkScore()
    }
    
    //MARK: Game Logic
    
    func setupGame(){
        isPaused = false
        changeValues()
        startTime = Date()
        setupTimer()
    }
    
    func changeValues(){
        switch self.selectedPlanet {
        case .moon:
            self.secondsNeeded = 60
            self.collectableNeeded = 9
            self.neutralizableNeeded = 6
        case .mars:
            self.secondsNeeded = 45
            self.collectableNeeded = 8
            self.neutralizableNeeded = 8
        }
        secondsRemaining = secondsNeeded
    }
    
    func checkScore() {
        if collectableScore >= collectableNeeded && neutralizableScore >= neutralizableNeeded {
            isVictory = true
        }
    }
    
    func setupTimer() {
        gameTimer?.invalidate()
        gameTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            self.timerTick()
        }
    }
    
    func timerTick() {
        if isPaused {
            return
        }
        secondsRemaining -= 1
        if secondsRemaining <= 0 {
            gameOver()
        }
    }
    
    func pauseGame(){
        pausedTime = Date()
        gameTimer?.invalidate()
    }
    
    func returnGame(){
        if let pausedTime = pausedTime {
            let timeIntervalSincePause = Date().timeIntervalSince(pausedTime)
            secondsRemaining -= Int(timeIntervalSincePause)
        }
        setupTimer()
    }
    
    /// Handles the logic when the game is over.
    func gameOver(){
        gameTimer?.invalidate()
        isGameOver = true
    }
    
}
