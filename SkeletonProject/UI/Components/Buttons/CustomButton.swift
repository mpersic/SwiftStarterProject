//
//  CustomButton.swift
//  SkeletonProject
//
//  Created by Matej Persic on 06.10.2024..
//

import SwiftUI

struct CustomButton: View {
    let buttonText: String
    let buttonHeight: CGFloat
    let isSmallButton: Bool
    let tappedAction: () -> Void
    let minimumWidth: CGFloat
    let backgroundColor: Color
    let textSize: CGFloat = 14

    init(buttonText: String,
         buttonHeight: CGFloat = 50,
         isSmallButton: Bool = false,
         minimumWidth: CGFloat = 130,
         backgroundColor: Color = Color.green,
         tappedAction: @escaping () -> Void) {
        self.buttonText = buttonText
        self.tappedAction = tappedAction
        self.buttonHeight = buttonHeight
        self.isSmallButton = isSmallButton
        self.minimumWidth = minimumWidth
        self.backgroundColor = backgroundColor
    }

    var body: some View {
        Button(action: tappedAction) {
            ZStack {
                RoundedRectangle(cornerRadius: buttonHeight / 2)
                    .fill(backgroundColor)
                    .overlay(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.white.opacity(0.6), Color.clear]),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                        .cornerRadius(buttonHeight / 2)
                    )
                
                Text(buttonText)
                    .font(.custom(Fonts.PoppinsMedium, size: textSize))
                    .foregroundColor(.white)
            }
            .frame(width: minimumWidth, height: buttonHeight)
            .shadow(radius: 4)
            .padding(.horizontal, 10)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    CustomButton(buttonText: "BLA", tappedAction: {})
}
