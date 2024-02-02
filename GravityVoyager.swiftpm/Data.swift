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
            description: "Is a stable isotope of helium and it is characterized by having two protons and two neutrons in its nucleus. Helium-4 constitutes approximately 25% to 45% of the lunar atmosphere, making it the dominant component.",
            origin: "Originates primarily from the radioactive decay of uranium and thorium present in the lunar rocks. These radioactive elements undergo alpha decay, emitting helium-4 nuclei as a byproduct. Over geological time scales, the accumulated helium-4 is released into the lunar atmosphere through processes such as volcanic outgassing and diffusion from the regolith.",
            chemicalProperties: "Is an inert, non-reactive gas under normal conditions. It is colorless, odorless, and tasteless, exhibiting low solubility in water and other solvents. Due to its extremely low boiling and freezing points, helium-4 remains in a gaseous state over a wide range of temperatures and pressures. ",
            usesAndApplications: "Has several important applications, including its use as a coolant in cryogenics and superconductivity research. Its exceptionally low boiling point near absolute zero (-269°C) makes it ideal for cooling superconducting magnets in applications such as magnetic resonance imaging (MRI) machines and particle accelerators. "
        ),
        AtmosphericElement(
            name: "Neon",
            imageName: "Ne",
            description: "Neon, is a noble gas that constitutes approximately 20% to 30% of the lunar atmosphere. It is characterized by its colorless, odorless, and inert properties, existing as a monatomic molecule, Ne. Neon is one of the six noble gases and is the fifth most abundant element in the universe, although it is relatively rare on Earth.",
            origin: "Originates from various sources, including volcanic outgassing, nuclear reactions occurring within the lunar regolith, and the implantation of solar wind particles.",
            chemicalProperties: "Is chemically inert under normal conditions, owing to its stable electronic configuration with a complete outer shell of electrons. It belongs to group 18 of the periodic table and exhibits low solubility, low reactivity, and high ionization energy.",
            usesAndApplications: "One of its most well-known uses is in neon lighting and advertising signs, where it emits a distinctive orange-red glow when electrically charged. Additionally, neon is employed in high-voltage indicators and as a cryogenic refrigerant in various scientific applications."
        ),
        AtmosphericElement(
            name: "Hydrogen",
            imageName: "H2",
            description: "Is the lightest and most abundant element in the universe. On the Moon, hydrogen constitutes approximately 1% of the lunar atmosphere and is mainly sourced from solar wind interactions with the lunar surface.",
            origin: "Originates primarily from solar wind interactions, where protons in the solar wind are implanted into the lunar regolith. Hydrogen is also released during the breakdown of water molecules present in lunar rocks and soil due to intense solar radiation.",
            chemicalProperties: "Is a highly reactive and versatile element. As a diatomic molecule, H2, hydrogen forms strong covalent bonds between its two atoms. It is colorless, odorless, and tasteless in its gaseous state. Hydrogen has the lowest molecular weight of all elements and can easily diffuse through many materials.",
            usesAndApplications: "It is commonly used as a fuel for rocket propulsion systems, where it provides high energy output with minimal environmental impact. Hydrogen fuel cells utilize the electrochemical reaction between hydrogen and oxygen to generate electricity, offering a clean and efficient power source."
        ),
        AtmosphericElement(
            name: "Argon",
            imageName: "Ar",
            description: "Argon is a noble gas found in trace amounts in the lunar atmosphere. It constitutes approximately 1% of the lunar atmosphere. Is chemically inert and colorless, making it suitable for various scientific and industrial applications.",
            origin: "Is primarily sourced from the radioactive decay of potassium-40 (40K) and other radioactive isotopes present in lunar rocks and regolith. When these isotopes decay, they release argon gas into the atmosphere over geological timescales.",
            chemicalProperties: "Argon is a noble gas and therefore exhibits high chemical stability and low reactivity. It is monatomic, meaning it exists as single atoms rather than molecules, and forms no compounds under normal conditions.",
            usesAndApplications: "In the metal industry, is used as a shielding gas in arc welding processes to prevent oxidation and improve weld quality. It is also employed in the production of specialty metals and alloys. In the field of electronics, argon is utilized as a carrier gas in gas chromatography and as a quenching gas in fluorescent and incandescent lighting."
        ),
        AtmosphericElement(
            name: "Methane",
            imageName: "CH4",
            description: "Is a colorless, odorless, and highly flammable gas that constitutes a minute fraction of the lunar atmosphere. Its presence is primarily attributed to external sources such as cometary impacts, solar wind, or migration from other celestial bodies.",
            origin: "The origin of methane in the lunar atmosphere remains uncertain. It is hypothesized that methane may originate from exogenous sources, such as cometary impacts or solar wind implantation. Another possibility is the migration of methane from other celestial bodies through meteoritic bombardment or other mechanisms.",
            chemicalProperties: "Is a simple hydrocarbon consisting of one carbon atom bonded to four hydrogen atoms. It is a non-polar molecule with a tetrahedral molecular geometry. Methane is highly flammable and combustible in the presence of oxygen, producing carbon dioxide and water vapor as combustion byproducts.",
            usesAndApplications: "Is commonly used as a fuel source for heating, electricity generation, and transportation. In space exploration, methane could serve as a potential propellant for spacecraft propulsion systems, offering advantages such as high specific impulse and compatibility with in-situ resource utilization technologies."
        )
    ]
    
    let marsElements: [AtmosphericElement] = [
        AtmosphericElement(
            name: "Carbon Dioxide",
            imageName: "CO2",
            description: "Is a colorless, odorless gas that constitutes the majority of the Martian atmosphere, accounting for approximately 95% to 96% of its composition. It is a greenhouse gas that contributes to the planet's greenhouse effect, trapping heat and regulating surface temperatures.",
            origin: "The primary source of carbon dioxide in the Martian atmosphere is attributed to outgassing from volcanic activity and the release of carbon dioxide stored in polar ice caps during seasonal variations. ",
            chemicalProperties: "Is a linear molecule composed of one carbon atom bonded to two oxygen atoms through double covalent bonds. It is a stable molecule under normal atmospheric conditions and serves as a key component in the carbon cycle of Mars. ",
            usesAndApplications: "In the food and beverage industry, carbon dioxide is commonly used to carbonate beverages, extend shelf life in packaged foods, and control pH levels during food processing. Additionally, it serves as a key component in fire extinguishers, where it displaces oxygen to suppress flames."
        ),
        AtmosphericElement(
            name: "Nitrogen",
            imageName: "N2",
            description: "Is a diatomic molecule consisting of two nitrogen atoms bonded together. It constitutes a small percentage of the Martian atmosphere, approximately 2.7%. ",
            origin: "The origin of nitrogen in the Martian atmosphere is believed to be primarily from outgassing of the planet's interior, volcanic eruptions, and thermal escape processes.",
            chemicalProperties: "Is a colorless, odorless, and inert gas under standard conditions. It is relatively stable and does not readily react with other elements or compounds in atmosphere. Nitrogen molecules consist of two nitrogen atoms bound by a strong triple bond, making it chemically unreactive in most atmospheric conditions.",
            usesAndApplications: "In the food industry, is utilized for packaging to preserve the freshness and quality of perishable goods by preventing oxidation and spoilage. In the manufacturing sector, serves as a blanketing gas in chemical processes to prevent the formation of explosive atmospheres and inhibit oxidation during production and storage."
        ),
        AtmosphericElement(
            name: "Xenon",
            imageName: "Ar",
            description: "Xenon is a noble gas that is colorless, odorless, and chemically inert. It is present in trace amounts in the Martian atmosphere, similar to its occurrence on Earth.",
            origin: "The origin of xenon in the Martian atmosphere is primarily attributed to the degassing of the planet's interior and the release of trapped gases from Martian rocks and regolith. Xenon is also produced through radioactive decay processes of certain isotopes within the Martian crust.",
            chemicalProperties: "Xenon exhibits minimal chemical reactivity under normal atmospheric conditions, making it a stable and inert element. It is characterized by its ability to form compounds with highly electronegative elements, such as fluorine and nitrogen, under specific laboratory conditions.",
            usesAndApplications: "In medicine, is employed as an inhaled anesthetic agent during surgical and diagnostic procedures. It's also utilized in radiation detectors to monitor radiation levels in nuclear facilities and medical applications. It is effective in detecting alpha, beta, and gamma particles, contributing to radiation safety and protection measures."
        ),
        AtmosphericElement(
            name: "Carbon Monoxide",
            imageName: "CO",
            description: "Is a colorless, odorless, and toxic gas composed of one carbon atom and one oxygen atom. It is present in small quantities in the Martian atmosphere, similar to its occurrence on Earth.",
            origin: "It's origin can be attributed to a combination of geological and atmospheric processes. Volcanic eruptions, which occur sporadically on Mars, release carbon monoxide and other gases into the atmosphere. In addition, interactions between ultraviolet (UV) radiation from the Sun and carbon dioxide (CO2) can lead to the formation of carbon monoxide through photodissociation reactions.",
            chemicalProperties: "Is a highly reactive gas that readily participates in chemical reactions with other atmospheric constituents. It is a powerful reducing agent and can react with oxidizing agents to produce carbon dioxide (CO2) or other oxidized carbon compounds.",
            usesAndApplications: "One of its primary uses lies in chemical synthesis, serving as a versatile building block for various industrial processes. It plays a crucial role in the production of organic chemicals which are key intermediates in the manufacturing of plastics, pharmaceuticals, and solvents."
        )
    ]
    
    
}

