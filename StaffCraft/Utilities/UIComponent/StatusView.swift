//
//  StatusView.swift
//  StaffCraft
//
//  Created by Tshikonwani, Thanyani TR on 2024/05/30.
//

import SwiftUI

struct StatusView: View {
    
    var status: StatusType
    var headline: String
    var subheadline: String
    
    @State private var isShowingEmployeeView = false
    @EnvironmentObject var userData: UserData
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(spacing: 20) {
            statusIcon
            Text(headline)
                .font(.headline)
                .padding(.top, 10)
            Text(subheadline)
                .font(.subheadline)
                .padding(.horizontal, 20)
                .multilineTextAlignment(.center)
            Spacer()
            if status == .success {
                doneButton
            } else {
                closeButton
            }
        }
        .padding()
        .navigationBarBackButtonHidden(true)
    }
    
    private var statusIcon: some View {
        Image(systemName: status == .success ? "checkmark.circle" : "xmark.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 100, height: 100)
            .foregroundColor(status == .success ? .green : .red)
    }
    
    private var doneButton: some View {
        VStack {
            NavigationLink(destination: EmployeeView(), isActive: $isShowingEmployeeView) {
                EmptyView()
            }
            Button(action: {
                isShowingEmployeeView = true
                userData.reset()
            }) {
                Text("DONE")
                    .foregroundColor(.black)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.black, lineWidth: 1)
                            .frame(height: 40)
                    )
            }
            .padding()
        }
    }
    
    private var closeButton: some View {
        VStack {
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("DISMISS")
                    .foregroundColor(.black)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.black, lineWidth: 1)
                            .frame(height: 40)
                    )
            }
            .padding()
            .navigationBarBackButtonHidden(false)
        }
    }
}


