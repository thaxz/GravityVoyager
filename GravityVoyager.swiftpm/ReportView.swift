import Foundation
import SwiftUI

/// A view for displaying the reports when you win the game
struct ReportView: View {
    
    /// The type of planet associated with the report
    let planet: PlanetType
    
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
            TabView {
                ForEach(planet.data.atmosphericElements){ element in
                    ScrollView{
                        VStack(spacing: 24){
                            ReportHeader(element: element)
                            ReportBody(element: element, type: .about)
                            ReportBody(element: element, type: .origin)
                            ReportBody(element: element, type: .chemicalProperties)
                            ReportBody(element: element, type: .usesAndApplications)
                        }
                        .padding(20)
                    }
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .always))
            
        }
    }
}

struct ReportView_Previews: PreviewProvider {
    static var previews: some View {
        ReportView(planet: dev.mockMoon)
    }
}
