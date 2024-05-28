//
//  CustomTextField.swift
//  StaffCraft
//
//  Created by Tshikonwani, Thanyani TR on 2024/05/28.
//

import SwiftUI

struct CustomTextField: View {
   
    @Binding var text: String
    var placeholder: String
    var strokeColor: Color
    var lineWidth: CGFloat
    var padding: CGFloat
    var isSecure: Bool

    var body: some View {
        VStack {
            if isSecure {
                SecureField(placeholder, text: $text)
                    .padding(padding)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(strokeColor, lineWidth: lineWidth)
                    )
            } else {
                TextField(placeholder, text: $text)
                    .padding(padding)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(strokeColor, lineWidth: lineWidth)
                    )
            }
        }
        .padding(.horizontal)
    }
}
