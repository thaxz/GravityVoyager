//
//  InfoView.swift
//  Gravity Voyager
//
//  Created by thaxz on 15/02/24.
//

import SwiftUI

/// The view responsible for displaying information about the game. It's used as a sheet
struct InfoView: View {
    var body: some View {
        ZStack{
            Color.white.ignoresSafeArea()
            VStack(alignment: .leading, spacing: 30){
                HStack {
                    Image("beckerIllustration")
                        .resizable()
                        .frame(width: 100, height: 100)
                    Spacer()
                    Text("Gravity Voyager")
                        .font(.system(size: 40, weight: .heavy))
                        .foregroundColor(.theme.text)
                        .multilineTextAlignment(.trailing)
                }
                Text("This game is an augmented reality twist on classic shooter games. Join the Grace-Jemison Space Exploration Institute and embark on a mission to collect vital data about the atmospheric components of distant planets.")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.theme.text)
                Text("Utilize your specialized equipment to touch down in the atmosphere, gathering and neutralizing essential components required for our research reports.")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.theme.text)
                Text("Be mindful of the ticking clock and ensure you take the right actions for each component type. Best of luck on your expedition!")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.theme.text)
                Spacer()
            }
            .padding(42 )
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
