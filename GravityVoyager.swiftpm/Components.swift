import Foundation
import SwiftUI

//Creating components in order to build reusable blocks of functionality and make code modular

// MARK: Buttons
/// Primary button component
struct PrimaryButton: View {
    let title: String
    let action: () -> ()
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .foregroundColor(Color.theme.primary)
                Text(title)
                    .font(.system(size: 22, weight: .medium))
                    .foregroundColor(.white)
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: 55)
    }
}

/// Secondary button component
struct SecondaryButton: View {
    let title: String
    let action: () -> ()
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .foregroundColor(.theme.secondary)
                Text(title)
                    .font(.system(size: 22, weight: .medium))
                    .foregroundColor(.white)
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: 55)
    }
}

// MARK: Dialogue
/// Container that holds the dialogue and it's used on DialogueView
struct DialogueContainer: View {
    var text: String
    var body: some View {
        ZStack(alignment: .topLeading){
            RoundedRectangle(cornerRadius: 8)
                .foregroundColor(Color.theme.secondary)
            Text(text)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
                .padding(16)
        }
        .frame(height: 140)
    }
}

/// Dialogue button component
struct DialogueButton: View {
    let title: String
    let type: TypeOfButton
    let action: () -> Void
    let color: Color
    init(title: String, type: TypeOfButton, action: @escaping () -> Void) {
        self.title = title
        self.type = type
        self.action = action
        switch type {
        case .primary:
            color = Color.theme.primary
        case .secondary:
            color = Color.theme.secondary
        }
    }
    var body: some View {
        Button {
            action()
        } label: {
            ZStack{
                RoundedRectangle(cornerRadius: 8)
                    .foregroundColor(color)
                Text(title)
                    .foregroundColor(.white)
                    .font(.system(size: 17, weight: .bold))
            }
            .frame(width: 110,height: 40)
        }
    }
}

// MARK: Report
/// Customizable container that displays the name and the image of each element  and it's used on ReportView
struct ReportHeader: View {
    let element: AtmosphericElement
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 8)
                .foregroundColor(Color.theme.secondary)
                .opacity(0.80)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(.white, lineWidth: 3)
                )
            HStack(spacing: 24){
                Image(element.imageName)
                    .resizable()
                    .frame(width: 70, height: 70)
                    .foregroundColor(.white)
                Text(element.name)
                    .font(.system(size: 36, weight: .black))
                    .minimumScaleFactor(0.8)
                    .foregroundColor(.white)
                Spacer()
            }
            .padding(16)
            .multilineTextAlignment(.leading)
        }
        .frame(height: 100)
    }
}

/// Customizable container that displays information about the elements and it's used on ReportView
struct ReportBody: View {
    let element: AtmosphericElement
    let type: TypeOfInformation
    let description: String
    init(element: AtmosphericElement, type: TypeOfInformation) {
        self.element = element
        self.type = type
        switch type {
        case .about:
            self.description = element.description
        case .origin:
            self.description = element.origin
        case .chemicalProperties:
            self.description = element.chemicalProperties
        case .usesAndApplications:
            self.description = element.usesAndApplications
        }
    }
    var body: some View {
        ZStack(){
            RoundedRectangle(cornerRadius: 8)
                .foregroundColor(Color.theme.secondary)
                .opacity(0.80)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(.white, lineWidth: 3)
                )
            VStack(alignment: .leading, spacing: 24){
                Text(type.rawValue)
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.white)
                Text(description)
                    .font(.system(size: 17, weight: .regular))
                    .foregroundColor(.white)
                    .minimumScaleFactor(0.8)
                Spacer()
            }
            .padding(.top, 24)
            .padding(.horizontal, 16)
            .multilineTextAlignment(.leading)
        }
        .frame(maxHeight: 300)
    }
}

// MARK: Timer
///Container that holds the time remaining for each level, it's used on GameView
struct TimeContainer: View {
    var time: Int
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .frame(width: 120, height: 50)
                .foregroundColor(Color.theme.secondary.opacity(0.30))
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.white, lineWidth: 2)
                )
            HStack(spacing: 10){
                Image(systemName: "clock.fill")
                    .resizable()
                    .frame(width: 18, height: 18)
                    .foregroundColor(.white)
                if time >= 10 {
                    Text("00:\(time)")
                        .font(.system(size: 22, weight: .semibold))
                        .foregroundColor(.white)
                } else {
                    Text("00:0\(time)")
                        .font(.system(size: 22, weight: .semibold))
                        .foregroundColor(.yellow)
                }
            }
        }
    }
}

struct Components_PreviewProvider: PreviewProvider {
    static var previews: some View {
        VStack{
            ReportHeader(element: dev.mockElement)
            ReportBody(element: dev.mockElement, type: .about)
        }
        .padding(20)
    }
}
