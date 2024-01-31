import SwiftUI
import Foundation

struct Dialogue {
    
    let moon: [String] = [
        "Hello! It's a joy to welcome you back to our team of space pilots. Since your last mission, you've become a legend in space exploration.",
        "As you know, here at the Grace-Jemison Institute, we're more than just an institution. We're a community dedicated to exploration and discovery in the universe.",
        "We stand at incredible opportunities to expand our horizons, and we've chosen you to lead this mission. This time, your task goes beyond ship control; you'll land and explore the surfaces of the Moon.",
        "Your mission is crucial. Collecting samples to contribute to our understanding of the cosmos. Each discovery of yours will be a valuable piece in the universe's puzzle.",
        "May this mission mark a new era in interplanetary exploration. May your steps continue to inspire future generations of space explorers. Good luck! We look forward to seeing what you'll discover."
    ]
    
    let mars: [String] = [
        "Welcome back to the Grace-Jemison Institute base. Your last mission on the Moon was exceptional, and your discoveries inspired everyone here.",
        "As the leader of this new era in interplanetary exploration, your next journey will be to Mars. The Red Planet awaits your exploration!",
        "Upon landing on Mars, your task will be to collect samples, and explore terrains that were previously only imagined. Each step you take represents a significant leap in our understanding of the cosmos.",
        "Our goal is to continue expanding human knowledge about Mars, and your advanced spacesuit and high-tech devices are ready for another incredible mission.",
        "May your courage continue to be the guiding light in our quest for knowledge. We look forward to the discoveries you will bring from this mission on Mars. Good luck!"
    ]
    
}

struct PlanetsData {
    
    let moonElements: [AtmosphericElement] = [
        AtmosphericElement(name: "algo da lua", composition: "algo da lua")
    ]
    
    let marsElements: [AtmosphericElement] = [
        AtmosphericElement(name: "algo de marte", composition: "algo de marte")
    ]
    
    
    
}

