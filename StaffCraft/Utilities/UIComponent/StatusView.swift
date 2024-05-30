//
//  StatusView.swift
//  StaffCraft
//
//  Created by Tshikonwani, Thanyani TR on 2024/05/30.
//

import SwiftUI

struct StatusView: View{
    
    var status: StatusType
    var headline: String
    var subheadline: String
    
    @State private var isShowingStatusView = false
    
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: status == .success ? "checkmark.circle.outlined" : "xmark.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .foregroundColor(status == .success ? .green : .red)
            
            Text(headline)
                .font(.headline)
                .padding(.top, 10)
            
            Text(subheadline)
                .font(.subheadline)
                .padding(.horizontal, 20)
                .multilineTextAlignment(.center)
            
            Spacer()
            
            if status == .success {
                Button(action: {
                    isShowingStatusView = true
                    NavigationLink(destination: EmployeeView(),
                                   isActive: $isShowingStatusView) {
                        EmptyView()
                    }
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
        .padding()
        .navigationBarBackButtonHidden(true)
        
    }
}
