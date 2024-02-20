import SwiftUI
import Foundation

/// A struct that manages the dialogues used within the application for different missions.
struct Dialogue {
    
    /// An array of strings representing the dialogues for Moon mission
    let moon: [String] = [
        "Hello! It's a joy to welcome you back to our team of space pilots. Since your last mission, you've become a legend in space exploration.",
        "As you know, here at the Grace-Jemison Institute, we're more than just an institution. We're a community dedicated to exploration and discovery in the universe.",
        "We stand at incredible opportunities to expand our horizons, and we've chosen you to lead this mission. This time, your task goes beyond ship control; you'll land and explore the surfaces of the Moon.",
        "Your mission is crucial. Collecting samples to contribute to our understanding of the cosmos. Each discovery of yours will be a valuable piece in the universe's puzzle.",
        "May this mission mark a new era in interplanetary exploration. May your steps continue to inspire future generations of space explorers. Good luck! We look forward to seeing what you'll discover."
    ]
    
    /// An array of strings representing the dialogues for Mars mission
    let mars: [String] = [
        "Welcome back to the Grace-Jemison Institute base. Your last mission on the Moon was exceptional, and your discoveries inspired everyone here.",
        "As the leader of this new era in interplanetary exploration, your next journey will be to Mars. The Red Planet awaits your exploration!",
        "Upon landing on Mars, your task will be to collect samples, and explore terrains that were previously only imagined. Each step you take represents a significant leap in our understanding of the cosmos.",
        "Our goal is to continue expanding human knowledge about Mars, and your advanced spacesuit and high-tech devices are ready for another incredible mission.",
        "May your courage continue to be the guiding light in our quest for knowledge. We look forward to the discoveries you will bring from this mission on Mars. Good luck!"
    ]
}

/// A struct that holds data related to the atmospheric elements found on the Moon and Mars.
struct PlanetsData {
    
    /// An array containing atmospheric elements found on the Moon
    let moonElements: [AtmosphericElement] = [
        AtmosphericElement(
            name: "Helium",
            imageName: "collectMoon1",
            description: "NASA's Lunar Reconnaissance Orbiter (LRO) detected helium in the lunar exosphere using an onboard spectrometer. Measurements from the 1970s showed an increase in helium abundance as night progressed, a result that could be explained by atmospheric cooling, which concentrates atoms at lower altitudes.",
            origin: "Primarily originates from the radioactive decay of uranium and thorium present in lunar rocks. These radioactive elements undergo alpha decay, emitting helium nuclei as a byproduct. Over geological time scales, the accumulated helium is released into the lunar exosphere through processes such as volcanic outgassing and diffusion from the regolith.",
            chemicalProperties: "Helium is an inert, non-reactive gas under normal conditions. It is colorless, odorless, and tasteless, exhibiting low solubility in water and other solvents. Due to its extremely low boiling and freezing points, helium-4 remains in a gaseous state over a wide range of temperatures and pressures.",
            usesAndApplications: "Helium has several important applications, including its use as a coolant in cryogenics and superconductivity research. Its exceptionally low boiling point near absolute zero (-269°C) makes it ideal for cooling superconducting magnets in applications such as magnetic resonance imaging (MRI) machines and particle accelerators."
        ),
        AtmosphericElement(
            name: "Neon",
            imageName: "collectMoon2",
            description: "The moon may lack casinos or bustling diner signs, but it does have neon. NASA's LADEE spacecraft made the first detection of neon in the lunar exosphere. It is a noble gas characterized by its colorless, odorless, and inert properties, existing as a monatomic molecule, Ne.",
            origin: "Originates from various sources, including volcanic outgassing, nuclear reactions occurring within the lunar regolith, and the implantation of solar wind particles.",
            chemicalProperties: "Neon is chemically inert under normal conditions, owing to its stable electronic configuration with a complete outer shell of electrons. It belongs to group 18 of the periodic table and exhibits low solubility, low reactivity, and high ionization energy.",
            usesAndApplications: "One of its most well-known uses is in neon lighting and advertising signs, where it emits a distinctive orange-red glow when electrically charged. Additionally, neon is employed in high-voltage indicators and as a cryogenic refrigerant in various scientific applications."
        ),
        AtmosphericElement(
            name: "Hydrogen",
            imageName: "collectMoon3",
            description: "Hydrogen on the moon was first discovered by researchers with the U.S. Naval Research Laboratory (NRL), who were provided lunar samples by NASA for a research study. Recent research by NASA’s Lunar Reconnaissance Orbiter (LRO) spacecraft indicates these deposits of hydrogen may be slightly more abundant on crater slopes in the southern hemisphere that face the lunar South Pole.",
            origin: "Primarily originates from solar wind interactions, where protons in the solar wind are implanted into the lunar regolith. Hydrogen is also released during the breakdown of water molecules present in lunar rocks and soil due to intense solar radiation.",
            chemicalProperties: "Hydrogen is a highly reactive and versatile element. As a diatomic molecule, H2, hydrogen forms strong covalent bonds between its two atoms. It is colorless, odorless, and tasteless in its gaseous state. Hydrogen has the lowest molecular weight of all elements and can easily diffuse through many materials.",
            usesAndApplications: "It is commonly used as a fuel for rocket propulsion systems, providing high energy output with minimal environmental impact. Hydrogen also has many other uses. In the chemical industry, it is used to make ammonia for agricultural fertilizer (the Haber process) and cyclohexane and methanol, which are intermediates in the production of plastics and pharmaceuticals."
        ),
        AtmosphericElement(
            name: "Argon",
            imageName: "neutralizeMoon1",
            description: "The surface-based mass spectrometer Lunar Atmosphere Composition Experiment (LACE) deployed during the Apollo 17 mission first detected argon on the moon. The argon density at the Apollo 17 site was seen to vary cyclically and also to show an overall decrease in density during 9 lunations.",
            origin: "Is primarily sourced from the radioactive decay of potassium-40 (40K) and other radioactive isotopes present in lunar rocks and regolith. When these isotopes decay, they release argon gas into the atmosphere over geological timescales.",
            chemicalProperties: "Argon is a noble gas and therefore exhibits high chemical stability and low reactivity. It is monatomic, meaning it exists as single atoms rather than molecules, and forms no compounds under normal conditions.",
            usesAndApplications: "In the metal industry, it is used as a shielding gas in arc welding processes to prevent oxidation and improve weld quality. It is also employed in the production of specialty metals and alloys. In the field of electronics, argon is utilized as a carrier gas in gas chromatography and as a quenching gas in fluorescent and incandescent lighting."
        ),
        AtmosphericElement(
            name: "Methane",
            imageName: "neutralizeMoon2",
            description: "A positive identification of methane in the lunar exosphere has been made in data from the neutral mass spectrometer on the Lunar Atmosphere and Dust Environment Explorer (LADEE) spacecraft. Like argon-40, methane is adsorbed on the lunar surface during nighttime.",
            origin: "The origin of methane in the lunar exosphere remains uncertain. It is hypothesized that methane may originate from exogenous sources, such as cometary impacts or solar wind implantation. Another possibility is the migration of methane from other celestial bodies through meteoritic bombardment or other mechanisms.",
            chemicalProperties: "Methane is a simple hydrocarbon consisting of one carbon atom bonded to four hydrogen atoms. It is a non-polar molecule with a tetrahedral molecular geometry. Methane is highly flammable and combustible in the presence of oxygen, producing carbon dioxide and water vapor as combustion byproducts.",
            usesAndApplications: "Is commonly used as a fuel source for heating, electricity generation, and transportation. Methane reacts with steam at high temperatures to yield carbon monoxide and hydrogen; the latter is used in the manufacture of ammonia for fertilizers and explosives."
        )
    ]
    
    /// An array containing atmospheric elements found on Mars
    let marsElements: [AtmosphericElement] = [
        AtmosphericElement(
            name: "Carbon Dioxide",
            imageName: "neutralizeMars1",
            description: "Mars is covered by a thin atmosphere, mostly composed of carbon dioxide. It's a colorless, odorless gas that makes up approximately 95% to 96% of the Martian atmosphere. It acts as a greenhouse gas, contributing to the planet's greenhouse effect by trapping heat and regulating surface temperatures.",
            origin: "The main source of carbon dioxide in the Martian atmosphere comes from volcanic activity and the release of carbon dioxide stored in polar ice caps during seasonal variations.",
            chemicalProperties: "Carbon dioxide is a linear molecule consisting of one carbon atom bonded to two oxygen atoms through double covalent bonds. It's a stable molecule under normal atmospheric conditions and plays a key role in Mars' carbon cycle.",
            usesAndApplications: "In the food and beverage industry, carbon dioxide is commonly used to carbonate beverages, extend shelf life in packaged foods, and control pH levels during food processing. Additionally, it serves as a key component in fire extinguishers, where it displaces oxygen to suppress flames."
        ),
        AtmosphericElement(
            name: "Nitrogen",
            imageName: "collectMars1",
            description: "A team using the Sample Analysis at Mars (SAM) instrument suite aboard NASA’s Curiosity rover detected nitrogen on the surface of Mars from release during heating of Martian sediments. The samples were first heated to release molecules bound to the soil, then portions of the gases released were diverted to the SAM.",
            origin: "The origin of nitrogen in the Martian atmosphere is believed to be primarily from outgassing of the planet's interior, volcanic eruptions, and thermal escape processes.",
            chemicalProperties: "Nitrogen is a colorless, odorless, and inert gas under standard conditions. It's relatively stable and does not readily react with other elements or compounds in the atmosphere. Nitrogen molecules consist of two nitrogen atoms bound by a strong triple bond, making it chemically unreactive in most atmospheric conditions.",
            usesAndApplications: "In the food industry, nitrogen is utilized for packaging to preserve the freshness and quality of perishable goods by preventing oxidation and spoilage. In the manufacturing sector, it serves as a blanketing gas in chemical processes to prevent the formation of explosive atmospheres and inhibit oxidation during production and storage."
        ),
        AtmosphericElement(
            name: "Xenon",
            imageName: "collectMars2",
            description: "Xenon has been discovered in the Martian atmosphere with the mass spectrometer on the second Viking lander. Xenon is only present in trace amounts. These findings come from the rover's Sample Analysis at Mars instrument suite, which studied xenon and krypton in Mars atmosphere.",
            origin: "The origin of xenon in the Martian atmosphere is primarily attributed to the degassing of the planet's interior and the release of trapped gases from Martian rocks and regolith. Xenon is also produced through radioactive decay processes of certain isotopes within the Martian crust.",
            chemicalProperties: "Xenon exhibits minimal chemical reactivity under normal atmospheric conditions, making it a stable and inert element. It is characterized by its ability to form compounds with highly electronegative elements, such as fluorine and nitrogen, under specific laboratory conditions.",
            usesAndApplications: "Xenon is utilized in radiation detectors to monitor radiation levels in nuclear facilities and medical applications. It is effective in detecting alpha, beta, and gamma particles, contributing to radiation safety and protection measures. It is also used in the manufacture of 5-fluorouracil, a drug used to treat certain types of cancer."
        ),
        AtmosphericElement(
            name: "Carbon Monoxide",
            imageName: "neutralizeMars1",
            description: "Carbon monoxide was first detected in the Martian atmosphere by Kaplan et al. (1969) using high spectral resolution infrared spectroscopy. It is a minor constituent in the Martian atmosphere, but it plays an important role in the photochemical cycle of CO2 production and loss.",
            origin: "Its origin can be attributed to a combination of geological and atmospheric processes. Volcanic eruptions, which occur sporadically on Mars, release carbon monoxide and other gases into the atmosphere. In addition, interactions between ultraviolet (UV) radiation from the Sun and carbon dioxide (CO2) can lead to the formation of carbon monoxide through photodissociation reactions.",
            chemicalProperties: "Carbon monoxide is a highly reactive gas that readily participates in chemical reactions with other atmospheric constituents. It is a powerful reducing agent and can react with oxidizing agents to produce carbon dioxide (CO2) or other oxidized carbon compounds.",
            usesAndApplications: "One of its primary uses lies in chemical synthesis, serving as a versatile building block for various industrial processes. It plays a crucial role in the production of organic chemicals which are key intermediates in the manufacturing of plastics, pharmaceuticals, and solvents."
        ),
        AtmosphericElement(
            name: "Perchlorate",
            imageName: "collectMars3",
            description: "Perchlorate was first detected on Mars by the Wet Chemistry Laboratory (WCL) instrument on the Phoenix lander at a concentration of ~0.5% in northern plains soils, which is a level considered toxic to humans. Since that initial detection, perchlorate has been detected on Mars by both surface and orbital instruments.",
            origin: "The origin of perchlorate on Mars is believed to be primarily geological, resulting from a combination of chemical weathering processes, volcanic activity, and atmospheric reactions. It is also possible that perchlorate was delivered to Mars through meteoritic impacts or other cosmic processes.",
            chemicalProperties: "It is highly soluble in water, which suggests the potential for liquid water to have been involved in its formation and distribution. Perchlorate is also stable under a wide range of environmental conditions, making it a valuable indicator of the past and present Martian climate and hydrology.",
            usesAndApplications: "They are commonly used as oxidizers in solid rocket propellants for space exploration and military missile systems. Additionally, perchlorate salts serve as key ingredients in pyrotechnics, explosives, and fireworks, producing bright flames and high-energy reactions."
        )
    ]
}

