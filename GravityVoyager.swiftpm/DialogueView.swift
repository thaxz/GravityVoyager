import Foundation
import SwiftUI

/// The view responsible for displaying dialogues within the game
struct DialogueView: View {
    
    /// The type of planet associated with the dialogue
    let planet: PlanetType
    
    /// The router manager for handling navigation within the app.
    @EnvironmentObject private var routeManager: NavigationRouter
    
    @State var text: String = ""
    @State var dialoguePosition: Int = 0
    @State var isAnimating: Bool = false
    
    var body: some View {
        ZStack(alignment: .bottom){
            Image("backgroundGradient")
                .resizable()
                .ignoresSafeArea()
            VStack(spacing: 24){
                DialogueContainer(text: text)
                HStack {
                    DialogueButton(title: "skip", type: .secondary) {
                        if !isAnimating {
                            routeManager.push(to: .tutorialView(planet: planet))
                            dialoguePosition = 0
                        }
                    }
                    Spacer()
                    DialogueButton(title: "next", type: .primary) {
                        if !isAnimating {
                            typeWriter()
                            dialoguePosition += 1
                            if dialoguePosition == 5 {
                                routeManager.push(to: .tutorialView(planet: planet))
                                dialoguePosition = 0
                            }
                        }
                    }
                }
            }
            .padding(20)
        }
        .onAppear{
            typeWriter()
        }
        .navigationBarBackButtonHidden(true)
    }
}

// MARK: Functions

extension DialogueView {
    
    /// Creates a typewriter effect as the dialogue is being written.
    func typeWriter(at position: Int = 0) {
        isAnimating = true
        if position == 0 {
            text = ""
        }
        if position < planet.data.dialogue[dialoguePosition].count {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.015) {
                text.append(planet.data.dialogue[dialoguePosition][position])
                typeWriter(at: position + 1)
            }
        } // waiting the text to finish
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            isAnimating = false
        }
    }
}

struct DialogueView_Previews: PreviewProvider {
    static var previews: some View {
        DialogueView(planet: dev.mockPlanet)
    }
}
