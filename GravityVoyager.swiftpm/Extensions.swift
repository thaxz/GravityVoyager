import Foundation
import SwiftUI

// MARK: Color extension to define the app's color theme.
extension Color {
    
    static let theme = ColorTheme()
    
}

struct ColorTheme {
    let primary = Color("primaryColor")
    let secondary = Color("secondaryColor")
    let background = Color("backgroundColor")
}

// todo: mudar
// MARK: The extension adds a subscript and The subscript takes an offset parameter of type Int and returns the corresponding character at the specified position. It's used on the TypeWritter effect

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
}
