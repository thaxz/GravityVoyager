import Foundation
import SwiftUI

// todo: mudar

// MARK: Extensions

// Color extension to define the app's color theme.
extension Color {
    
    static let theme = ColorTheme()
    
}

struct ColorTheme {
    let primary = Color("primaryColor")
    let secondary = Color("secondaryColor")
    let background = Color("backgroundColor")
}

//The extension adds a subscript and The subscript takes an offset parameter of type Int and returns the corresponding character at the specified position. It's used on the TypeWritter effect

extension String {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}

extension PreviewProvider {
    static var dev: DeveloperPreview{
        return DeveloperPreview.shared
    }
}

class DeveloperPreview {
    
    static let shared = DeveloperPreview()
    private init() {}
    
    let mockPlanet = PlanetType.mars
    let mockMoon = PlanetType.moon
    let mockElement = AtmosphericElement(
        name: "Helium-4",
        imageName: "He-4",
        description: "Helium-4 is the most abundant component in the lunar atmosphere, constituting approximately 25% to 45%.",
        origin: "It is primarily produced by the radioactive decay of uranium and thorium in lunar rocks.",
        chemicalProperties: "Helium-4 is an inert, non-reactive gas.",
        usesAndApplications: "It is used in cryogenics, superconductivity technology, and as a coolant in nuclear reactors."
    )
}

// MARK: Models

enum TypeOfButton {
    case primary
    case secondary
}

