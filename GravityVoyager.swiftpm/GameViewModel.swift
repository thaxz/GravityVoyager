import Foundation
import Combine

/// Protocol defining the delegate methods for game logic
protocol GameLogicDelegate {
    
    /// Adds a collectable point
    mutating func addCollectablePoint() -> Void
    /// Adds a neutralizable point
    mutating func addNeutralizablePoint() -> Void
    /// Handles game over logic
    mutating func gameOver() -> Void
    
}

/// View model for managing game logic and data in the app
class GameViewModel: ObservableObject, GameLogicDelegate {
    
    /// Shared instance of the GameViewModel
    static let shared = GameViewModel()
    private init () {}
    
    private var cancellables: Set<AnyCancellable> = []
    
    // MARK: Published Properties
    /// The selected planet for the game
    @Published var selectedPlanet: PlanetType = .moon
    /// Flags indicating the game status
    @Published var isPaused: Bool = false
    @Published var isGameOver: Bool = false
    @Published var isVictory: Bool = false
    /// The remaining seconds in the game
    @Published var secondsRemaining = 00
    /// The total seconds needed to complete the game
    @Published var secondsNeeded: Int = 00
    /// Scores
    @Published var collectableScore: Int = 0
    @Published var neutralizableScore: Int = 0
    
    // MARK: Game Parameters
    /// The number of collectable elements needed to win
    var collectableNeeded = 8
    /// The number of neutralizable elements needed to win
    var neutralizableNeeded = 6
    
    // MARK: Timer Properties
    var timerPausedDate: Date?
    var gameTimer: Timer?
    var startTime: Date? = nil
    private var pausedTime: Date?
    
    // MARK: Protocol Methods
    
    func addCollectablePoint() {
        collectableScore += 1
        checkScore()
    }
    
    func addNeutralizablePoint() {
        neutralizableScore += 1
        checkScore()
    }
    
    //MARK: Game Logic
    /// Sets up the initial game state
    /// This method initializes game parameters and starts the game timer
    func setupGame(){
        isPaused = false
        changeValues()
        startTime = Date()
        setupTimer()
    }
    
    /// Changes game values based on the selected planet
    /// This method sets the required scores and time needed to complete the game
    func changeValues(){
        collectableScore = 0
        neutralizableScore = 0
        switch self.selectedPlanet {
        case .moon:
            self.secondsNeeded = 60
            self.collectableNeeded = 5
            self.neutralizableNeeded = 5
        case .mars:
            self.secondsNeeded = 45
            self.collectableNeeded = 7
            self.neutralizableNeeded = 7
        }
        secondsRemaining = secondsNeeded
    }
    
    /// Checks if the collectable and neutralizable scores meet the win conditions
    func checkScore() {
        if collectableScore >= collectableNeeded && neutralizableScore >= neutralizableNeeded {
            isVictory = true
        }
    }
    
    /// Sets up the game timer
    func setupTimer() {
        gameTimer?.invalidate()
        gameTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            self.timerTick()
        }
    }
    
    /// Updates the game timer by decrementing the remaining time and checking if the game is over.
    func timerTick() {
        if isPaused {
            return
        }
        secondsRemaining -= 1
        if secondsRemaining <= 0 {
            gameOver()
        }
    }
    
    /// Pauses the game timer and records the pause time
    func pauseGame(){
        pausedTime = Date()
        gameTimer?.invalidate()
    }
    
    /// Resumes the game timer by calculating the time paused and resuming the game timer accordingly.
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
