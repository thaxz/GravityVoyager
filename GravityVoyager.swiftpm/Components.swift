import Foundation
import SwiftUI

// MARK: Buttons

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

struct SecondaryButton: View {
    let title: String
    let action: () -> ()
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.theme.primary, lineWidth: 3)
                    .background(
                        RoundedRectangle(cornerRadius: 16).foregroundColor(.theme.secondary)
                    )
                Text(title)
                    .font(.system(size: 22, weight: .medium))
                    .foregroundColor(.white)
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: 55)
    }
}

// todo: fazer switch com o type se é secondary ou primary pra mudar a cor do bg
struct DialogueButton: View {
    let title: String
    let action: () -> Void
    var body: some View {
        Button {
            action()
        } label: {
            ZStack{
                Rectangle()
                    .foregroundColor(Color.theme.secondary.opacity(0.30))
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(.white, lineWidth: 2)
                    )
                Text(title)
                    .foregroundColor(.white)
                    .font(.system(size: 17, weight: .bold))
            }
            .frame(width: 110,height: 40)
        }
    }
}

// MARK: Dialogue

struct DialogueContainer: View {
    var text: String
    var body: some View {
        ZStack(alignment: .topLeading){
            RoundedRectangle(cornerRadius: 8)
                .foregroundColor(Color.theme.secondary)
                .opacity(0.80)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(.white, lineWidth: 3)
                )
            Text(text)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
                .padding(16)
        }
        .frame(height: 140)
    }
}

// MARK: Report

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
