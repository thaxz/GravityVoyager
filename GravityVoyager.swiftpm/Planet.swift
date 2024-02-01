import Foundation

struct Planet {
    
    let name: String
    let dialogue: [String]
    let missionTime: Int
    let atmosphericElements: [AtmosphericElement]
    
}

struct AtmosphericElement: Identifiable {
    var id = UUID()
    let name: String
    let imageName: String
    let description: String
    let origin: String
    let chemicalProperties: String
    let usesAndApplications: String
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

enum TypeOfInformation: String {
    case about = "About"
    case origin = "Origin"
    case chemicalProperties = "Chemical Properties"
    case usesAndApplications = "Uses And Applications"
}
