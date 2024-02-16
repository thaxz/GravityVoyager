import Foundation
import SwiftUI

struct LevelsView: View {
    /// The router manager for handling navigation within the app.
    @EnvironmentObject private var routeManager: NavigationRouter
    @EnvironmentObject private var viewModel: GameViewModel
    @State var showInfoSheet: Bool = false
    
    var body: some View {
        ZStack {
            Image("backgroundGradient")
                .resizable()
                .ignoresSafeArea()
            VStack(spacing: 50){
                Image("moonButton")
                    .onTapGesture {
                        viewModel.selectedPlanet = .moon
                        routeManager.push(to: .dialogueView(planet: .moon))
                    }
                Image("marsButton")
                    .onTapGesture {
                        viewModel.selectedPlanet = .mars
                        routeManager.push(to: .dialogueView(planet: .mars))
                    }
            }
            .padding(32)
        }
        .navigationBarTitleDisplayMode(.large)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                infoButton
            }
        }
        .sheet(isPresented: $showInfoSheet){
            InfoView()
                .presentationDetents([.fraction(0.8)])
        }
    }
}

// MARK: Components

extension LevelsView {
    
    var infoButton: some View {
        Button {
            showInfoSheet.toggle()
        } label: {
            Image(systemName: "info")
                .resizable()
                .scaledToFit()
                .bold()
                .foregroundColor(.black)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(.white)
                        .frame(width: 40, height: 40)
                )
                .padding(.trailing, 12)
        }
    }
}

struct LevelsView_Previews: PreviewProvider {
    static var previews: some View {
        LevelsView()
    }
}
