import Foundation
import SwiftUI

/// View displayed when the game is paused
struct PauseView: View {
    
    /// The router manager for handling navigation within the app
    @EnvironmentObject private var routeManager: NavigationRouter
    /// Closure to resume the game
    let play: () -> Void
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.5).ignoresSafeArea()
            VStack{
                Spacer()
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .foregroundColor(Color.theme.secondary)
                        .frame(width: 230, height: 120)
                    HStack(spacing: 20){
                        Button {
                            play()
                        } label: {
                            RoundedRectangle(cornerRadius: 16)
                                .foregroundColor(Color.theme.primary)
                                .frame(width: 80, height: 80)
                                .overlay(
                                    Image(systemName: "play.fill")
                                        .resizable()
                                        .frame(width: 30, height: 33)
                                        .foregroundColor(.white)
                                )
                        }
                        Button {
                            routeManager.popToRoot()
                        } label: {
                            RoundedRectangle(cornerRadius: 16)
                                .foregroundColor(Color.theme.primary)
                                .frame(width: 80, height: 80)
                                .overlay(
                                    Image(systemName: "house")
                                        .resizable()
                                        .frame(width: 38, height: 33)
                                        .foregroundColor(.white)
                                )
                        }
                    }
                }
                Spacer()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct PauseView_Previews: PreviewProvider {
    static var previews: some View {
        PauseView(play: {})
    }
}
