# Gravity Voyager - WWDC Scholarship Application  

The Swift Playgound App was created for WWDDC24 Swift Student Challenge

## Introduction

Gravity Voyager is an augmented reality twist on classic shooter games. Join the Grace-Jemison Space Exploration Institute and embark on a mission to collect vital data about the atmospheric components of distant planets.
Utilize your specialized equipment to touch down in the atmosphere, gathering and neutralizing essential components required for our research reports.
Be mindful of the ticking clock and ensure you take the right actions for each component type. Best of luck on your expedition!


## Project

This game's logic involves user interaction with augmented reality components, where the objective is to collect the right amount of elements within the available time. For development, I immersed myself in the RealityKit and ARKit frameworks to set up the augmented reality scene. Additionally, I used SceneKit to handle the nodes, which represent the atmospheric elements, as well as to manage impulse systems and collision logic.

The application was developed in SwiftUI using object-oriented logic and MVVM architecture. I used the AVFoundation framework for the game's sounds and the UIFeedbackGenerator class for generating vibrations.

In terms of navigation, I utilized the new NavigationStack to create a custom NavigationPath with all the screen possibilities that the app would have. For data flow, I employed dependency injection along with the Combine framework and SwiftUI property wrappers.

To ensure that the game had an educational aspect, upon completing a mission, the player is rewarded with a report on all the elements they collected. I wanted the player to feel included in this reality, so the research was entirely based on information released by NASA in their reports.
  

## How to play

First, download the code project and open the app in Xcode/Playground. After that, since this game needs to access the device's camera, you need to built on an physic device.

## Credits
- "Collect Sound" by MATRIXXX_, an FreeSound user 
(https://freesound.org/people/MATRIXXX_/sounds/523547/)
- "Neutralize Sound" by Deathbyfairydust, an FreeSound user 
(https://freesound.org/people/deathbyfairydust/sounds/658431/)
- "Fail Sound" by Jugraf, an FreeSound user 
(https://freesound.org/people/jugraf/sounds/370209/)
- "Moon Information" by Nasa - SMD Content Editors
(https://science.nasa.gov/moon/)
- "Moon Composition" by Nasa - Andrea Jones 
(https://science.nasa.gov/moon/composition/)
- "Moon Formation" by Nasa - Prabal Saxena, Sarah Valencia and Bill Bottke 
(https://science.nasa.gov/moon/formation/)
- "Mars Information" by Nasa - SMD Content Editors
(https://science.nasa.gov/mars/)
- "Mars Composition" by Nasa - Andrea Jones 
(https://science.nasa.gov/mars/facts/)
- "Mars Atmosphere" by Arizona State University - Sheri Klug
(https://marsed.asu.edu/mep/atmosphere)
-  Besides, every other asset was totally made by Thaís Monteiro (Owner)

