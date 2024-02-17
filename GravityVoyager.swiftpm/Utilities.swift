import Foundation
import SwiftUI

// MARK: Extensions

/// Color extension to define the app's color theme.
extension Color {
    static let theme = ColorTheme()
}

/// Structure defining the color theme for the app.
struct ColorTheme {
    let primary = Color("primaryColor")
    let secondary = Color("secondaryColor")
    let terciary = Color("terciaryColor")
    let background = Color("backgroundColor")
    let text = Color("textColor")
    let mars = Color("marsColor")
    let moon = Color("moonColor")
}

/// The extension adds a subscript to String, allowing access to characters at specific indices.
/// Used in DialogueView to create the typewriter effect
extension String {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}

///Preview Provider Extension
extension PreviewProvider {
    static var dev: DeveloperPreview{
        return DeveloperPreview.shared
    }
}
/// Struct providing mock data for preview purposes
class DeveloperPreview {
    
    static let shared = DeveloperPreview()
    private init() {}
    
    let mockVm = GameViewModel.shared
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

// MARK: Enums

/// Enum defining the type of button.
enum TypeOfButton {
    case primary
    case secondary
}

/// Enum defining the type of sound.
enum SoundType: String {
    case neutralizeSound = "neutralizingElements"
    case collectSound = "collectingElements"
    case fail = "failSound"
}
