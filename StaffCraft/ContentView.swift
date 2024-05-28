//
//  ContentView.swift
//  StaffCraft
//
//  Created by Tshikonwani, Thanyani TR on 2024/05/28.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var userData = UserData()
    var body: some View {
        LoginView()
            .environmentObject(userData)
    }
}

#Preview {
    ContentView()
}
