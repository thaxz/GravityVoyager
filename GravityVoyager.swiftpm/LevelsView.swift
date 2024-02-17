import Foundation
import SwiftUI

/// A view allowing users to select different missions
struct LevelsView: View {
    
    /// The router manager for handling navigation within the app.
    @EnvironmentObject private var routeManager: NavigationRouter
    /// The view model managing game logic
    @EnvironmentObject private var viewModel: GameViewModel
    /// Boolean indicating whether the info sheet is shown
    @State var showInfoSheet: Bool = false
    
    var body: some View {
        ZStack {
            Image("backgroundGradient")
                .resizable()
                .ignoresSafeArea()
            VStack(spacing: 40){
                headerSection
                moonButton
                marsButton
                Spacer()
            }
            .padding(32)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                infoButton
            }
        }
        .sheet(isPresented: $showInfoSheet){
            InfoView()
                .presentationDetents([.medium])
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
                        .frame(width: 30, height: 30)
                )
                .padding(.trailing, 12)
        }
    }
    
    var headerSection: some View {
        RoundedRectangle(cornerRadius: 16)
            .frame(height: 100)
            .foregroundColor(.theme.secondary.opacity(0.30))
            .overlay(
                HStack(spacing: 20){
                    Image("folderIllustration")
                        .resizable()
                        .frame(width: 55, height: 45)
                    Text("Choose a mission")
                        .foregroundColor(.white)
                        .font(.system(size: 26, weight: .semibold))
                }
            )
    }
    
    var moonButton: some View {
        Button {
            viewModel.selectedPlanet = .moon
            routeManager.push(to: .dialogueView(planet: .moon))
        } label: {
            ZStack{
                RoundedRectangle(cornerRadius: 16)
                    .frame(height: 100)
                    .foregroundColor(.theme.moon)
                HStack(spacing: 16){
                    Image("moonButton")
                    Text("Moon")
                        .foregroundColor(.white)
                        .font(.system(size: 24, weight: .semibold))
                    Spacer()
                }
            }
        }
    }
    
    var marsButton: some View {
        Button {
            viewModel.selectedPlanet = .mars
            routeManager.push(to: .dialogueView(planet: .mars))
        } label: {
            ZStack{
                RoundedRectangle(cornerRadius: 16)
                    .frame(height: 100)
                    .foregroundColor(.theme.mars)
                HStack(spacing: 16){
                    Image("marsButton")
                    Text("Mars")
                        .foregroundColor(.white)
                        .font(.system(size: 24, weight: .semibold))
                    Spacer()
                }
            }
        }
    }
}

struct LevelsView_Previews: PreviewProvider {
    static var previews: some View {
        LevelsView()
    }
}
