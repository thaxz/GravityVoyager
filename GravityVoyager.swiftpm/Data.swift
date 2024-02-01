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
        AtmosphericElement(
            name: "Helium-4",
            imageName: "He-4",
            description: "Helium-4 is the most abundant component in the lunar atmosphere, constituting approximately 25% to 45%. Percentage Approximately 25% to 45%.",
            origin: "It is primarily produced by the radioactive decay of uranium and thorium in lunar rocks.",
            chemicalProperties: "Helium-4 is an inert, non-reactive gas.",
            usesAndApplications: "It is used in cryogenics, superconductivity technology, and as a coolant in nuclear reactors."
        ),
        AtmosphericElement(
            name: "Neon",
            imageName: "Ne",
            description: "Neon is the second most abundant gas in the lunar atmosphere, comprising about 20% to 30%. Percentage approximately 20% to 30%",
            origin: "It is released by volcanic eruptions and nuclear reactions on the lunar surface.",
            chemicalProperties: "Neon is an inert, non-reactive gas.",
            usesAndApplications: "It is used in lighting, indicator lights, lasers, and advertising signs."
        ),
        AtmosphericElement(
            name: "Hydrogen",
            imageName: "H2",
            description: "Hydrogen in the lunar atmosphere is predominantly the result of solar wind, accounting for about 1%. ",
            origin: "It is deposited by the solar wind, which delivers hydrogen protons to the lunar surface.",
            chemicalProperties: "Hydrogen is a flammable, highly reactive gas.",
            usesAndApplications: "It is used in ammonia production, rocket fuel, and hydrogen fuel cells."
        ),
        AtmosphericElement(
            name: "Argon",
            imageName: "Ar",
            description: "Argon is found in very small quantities in the lunar atmosphere, constituting traces. Traces",
            origin: "It is primarily released by radioactive decay.",
            chemicalProperties: "Argon is an inert, non-reactive gas.",
            usesAndApplications: "It is used in welding, lighting, and as a protective atmosphere in metallurgy."
        ),
        AtmosphericElement(
            name: "Methane",
            imageName: "CH4",
            description: "Methane is found in very small quantities in the lunar atmosphere. Traces",
            origin: "Its origins are not fully understood.",
            chemicalProperties: "Methane is a flammable, highly reactive gas.",
            usesAndApplications: "It is used as a fuel in rocket engines, for energy production, and in chemical processes."
        )
    ]
    
    let marsElements: [AtmosphericElement] = [
        AtmosphericElement(
            name: "Carbon Dioxide",
            imageName: "CO2",
            description: "Carbon dioxide makes up approximately 95% to 96% of the Martian atmosphere.",
            origin: "It is released from volcanic eruptions, impacts, and the weathering of rocks.",
            chemicalProperties: "Carbon dioxide is a greenhouse gas and is essential for sustaining the Martian atmosphere.",
            usesAndApplications: "It is used in fire extinguishers, carbonated beverages, and as a propellant in aerosol sprays."
        ),
        AtmosphericElement(
            name: "Nitrogen",
            imageName: "N2",
            description: "Nitrogen constitutes about 2.7% of the Martian atmosphere.",
            origin: "It is believed to be released from volcanic eruptions and cometary impacts.",
            chemicalProperties: "Nitrogen is a relatively inert gas under normal conditions.",
            usesAndApplications: "It is used in the production of ammonia, fertilizers, and explosives."
        ),
        AtmosphericElement(
            name: "Argon",
            imageName: "Ar",
            description: "Argon accounts for about 1.6% of the Martian atmosphere.",
            origin: "It is produced by the radioactive decay of potassium-40 in Martian rocks.",
            chemicalProperties: "Argon is an inert, non-reactive gas.",
            usesAndApplications: "It is used in welding, lighting, and as a protective atmosphere in metallurgy."
        ),
        AtmosphericElement(
            name: "Carbon Monoxide",
            imageName: "CO",
            description: "Carbon monoxide is present in small amounts in the Martian atmosphere.",
            origin: "It is produced by the incomplete combustion of carbon-containing compounds.",
            chemicalProperties: "Carbon monoxide is a colorless, odorless, and highly toxic gas.",
            usesAndApplications: "It is used in the production of chemicals, fuel gases, and as a reducing agent in metallurgy."
        )
    ]
    
    
}

