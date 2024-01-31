import Foundation
import SwiftUI

// TODO: SEND OBJECTS TO EACH SCREEN
// MARK: Enum representing different screens in the app's navigation flow.
enum Route {
    
    // Navigation cases
    /// Put every screen here and if needs an object, pass it ike this 'case yourItem(item: MyItem)
    case levelsView
    case dialogueView(planet: PlanetType)
    case tutorialView(planet: PlanetType)
    case gameView(planet: PlanetType)
    case winView(planet: PlanetType)
    case gameOverView(planet: PlanetType)
    case reportView(planet: PlanetType)
    case creditsView
}

// MARK: - View and Hashable Conformance

extension Route: View {
    /// A SwiftUI View representation of the current Route.
    ///
    var body: some View {
        switch self {
        case .levelsView:
            LevelsView()
        case .dialogueView(let planet):
            DialogueView(planet: planet)
        case .tutorialView(let planet):
            TutorialView(planet: planet)
        case .gameView(let planet):
            GameView(planet: planet)
        case .winView(let planet):
            WinView(planet: planet)
        case .gameOverView(let planet):
            GameOverView(planet: planet)
        case .reportView(let planet):
            ReportView(planet: planet)
        case .creditsView:
            CreditsView()
        }
    }
}

// MARK: Separating hashable protocol

extension Route: Hashable {
    
    /// Generates a hash value for the enum cases to conform to the Hashable protocol.
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.hashValue)
    }
    
    /// Compares enum cases for equality to conform to the Equatable protocol.
    static func == (lhs: Route, rhs: Route) -> Bool {
        switch (lhs, rhs){
        case (.levelsView, .levelsView):
            return true
        case (.dialogueView(let lshItem), .dialogueView(let rhsItem)):
            return lshItem.data.name == rhsItem.data.name
        case (.tutorialView(let lshItem), .tutorialView(let rhsItem)):
            return lshItem.data.name == rhsItem.data.name
        case (.gameView(let lshItem), .gameView(let rhsItem)):
            return lshItem.data.name == rhsItem.data.name
        case (.winView(let lshItem), .winView(let rhsItem)):
            return lshItem.data.name == rhsItem.data.name
        case (.gameOverView(let lshItem), .gameOverView(let rhsItem)):
            return lshItem.data.name == rhsItem.data.name
        case (.reportView(let lshItem), .reportView(let rhsItem)):
            return lshItem.data.name == rhsItem.data.name
        case (.creditsView, .creditsView):
            return true
        default:
            return false
        }
    }
}
