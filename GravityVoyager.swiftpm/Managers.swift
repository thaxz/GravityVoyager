//
//  Managers.swift
//  Gravity Voyager
//
//  Created by thaxz on 08/02/24.
//

import Foundation
import SwiftUI

class HapticManager {
    
    static let shared = HapticManager()
    private init () {}
    
    func impact(){
        let generator = UIImpactFeedbackGenerator(style: .heavy)
        generator.impactOccurred()
    }
}
