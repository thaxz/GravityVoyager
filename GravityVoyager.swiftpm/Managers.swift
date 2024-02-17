//
//  Managers.swift
//  Gravity Voyager
//
//  Created by thaxz on 08/02/24.
//

import Foundation
import SwiftUI
import AVFoundation

/// Controls haptics and vibrations for the app
class HapticManager {
    
    /// Shared instance of the HapticManager
    static let shared = HapticManager()
    private init () {}
    
    /// Triggers a heavy impact haptic feedback
    func impact(){
        let generator = UIImpactFeedbackGenerator(style: .heavy)
        generator.impactOccurred()
    }
}

/// Manages audio playback for the app
class SoundManager {
    
    /// Shared instance of the SoundManager
    static let shared = SoundManager()
    private init () {}
    
    var player: AVAudioPlayer?
    
    /// Plays a specified sound effect.
    /// - Parameter sound: The type of sound effect to be played.
    func playSound(sound: SoundType) {
        let url = Bundle.main.url(forResource: sound.rawValue, withExtension: "mp3")
        guard url != nil else {return}
        do {
            player = try AVAudioPlayer(contentsOf: url!)
            player?.setVolume(1.5, fadeDuration: 0.1)
            player?.play()
        } catch {
            print("erro tocando efeito sonoro")
        }
    }
}
