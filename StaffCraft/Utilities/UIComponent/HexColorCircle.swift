//
//  HexColorCircle.swift
//  StaffCraft
//
//  Created by Tshikonwani, Thanyani TR on 2024/05/28.
//

import SwiftUI

struct HexColorCircle: View {
    var hexColor: String?
    
    var body: some View {
        Circle()
            .fill(colorFromHex(hexColor))
            .frame(width: 40, height: 40)
    }
}

func colorFromHex(_ hex: String?) -> Color {
    guard let hex = hex else {
        return Color.black
    }
    
    let hexString = hex.hasPrefix("#") ? String(hex.dropFirst()) : hex
    
    guard hexString.count == 6, let intVal = Int(hexString, radix: 16) else {
        return Color.black
    }
    
    let red = Double((intVal >> 16) & 0xFF) / 255.0
    let green = Double((intVal >> 8) & 0xFF) / 255.0
    let blue = Double(intVal & 0xFF) / 255.0
    
    return Color(red: red, green: green, blue: blue)
}

#Preview {
    HexColorCircle()
}
