import Foundation
import SwiftUI

struct ReportView: View {
    
    let planet: PlanetType
    
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
            TabView {
                ForEach(1..<4){ _ in
                    VStack(spacing: 24){
                        ReportHeader()
                        ReportBody()
                        ReportBody()
                    }
                    .padding(20)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .always))
            
        }
    }
}

struct ReportView_Previews: PreviewProvider {
    static var previews: some View {
        ReportView(planet: dev.mockPlanet)
    }
}
