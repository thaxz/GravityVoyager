import Foundation

struct Planet {
    
    let name: String
    let dialogue: [String]
    let missionTime: Int
    let atmosphericElements: [AtmosphericElement]
    
}

struct AtmosphericElement {
    
    let name: String
    let composition: String
    
}

enum PlanetType {
    
    case moon
    case mars
    
    var data: Planet {
        switch self {
        case .moon:
            return Planet(name: "Moon", dialogue: Dialogue().moon, missionTime: 90, atmosphericElements: PlanetsData().moonElements)
        case .mars:
            return Planet(name: "Mars", dialogue: Dialogue().mars, missionTime: 60, atmosphericElements: PlanetsData().marsElements)
        }
    }
    
}
