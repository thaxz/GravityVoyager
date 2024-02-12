import Foundation
import SwiftUI

struct WinView: View {
    /// The router manager for handling navigation within the app.
    @EnvironmentObject private var routeManager: NavigationRouter
    @EnvironmentObject private var viewModel: GameViewModel
    
    let planet: PlanetType
    
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
            VStack(spacing: 26){
                Text("Mission accomplished!")
                    .font(.system(size: 36, weight: .bold))
                    .foregroundColor(.white)
                ZStack {
                    RoundedRectangle(cornerRadius: 32)
                        .foregroundColor(.theme.secondary)
                    VStack(spacing: 26){
                        headerText
                        HStack(spacing: 20){
                            catchedComponents
                            removedComponents
                        }
                    }
                    .padding(16)
                }
                Spacer()
                PrimaryButton(title: "See Relatory") {
                    routeManager.push(to: .reportView(planet: planet))
                }
                SecondaryButton(title: "Main Menu") {
                    routeManager.popToRoot()
                }
            }
            .padding(20)
            .multilineTextAlignment(.center)
        }
        .navigationBarBackButtonHidden(true)
    }
}

// MARK: Components

extension WinView {
    
    var headerText: some View {
        VStack(spacing: 32){
            Text("Well done!")
                .font(.system(size: 28, weight: .bold))
                .foregroundColor(.white)
            Text("You have managed to collect all the necessary samples in this region. Your report has been sent to the institute.")
                .font(.system(size: 20, weight: .regular))
                .foregroundColor(.white)
        }
    }
    
    var catchedComponents: some View {
        ZStack(){
            RoundedRectangle(cornerRadius: 16)
                .foregroundColor(.white.opacity(0.1))
            VStack{
                Image("folderIllustration")
                    .resizable()
                    .frame(width: 70, height: 60)
                Text("\(viewModel.collectableScore) \n collected")
                    .font(.system(size: 20, weight: .medium))
                    .foregroundColor(.white)
            }
        }
        .frame(width: 130, height: 150)
    }
    
    var removedComponents: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .foregroundColor(.white.opacity(0.1))
            VStack{
                Image("beckerIllustration")
                    .resizable()
                    .frame(width: 65, height: 65)
                Text("\(viewModel.neutralizableScore) \n neutralized")
                    .font(.system(size: 20, weight: .medium))
                    .foregroundColor(.white)
            }
        }
        .frame(width: 130, height: 150)
    }
    
}

struct WinView_Previews: PreviewProvider {
    static var previews: some View {
        WinView(planet: dev.mockPlanet)
            .environmentObject(dev.mockVm)
    }
}
