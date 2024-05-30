//
//  EmployeeReview.swift
//  StaffCraft
//
//  Created by Tshikonwani, Thanyani TR on 2024/05/29.
//

import SwiftUI

struct EmployeeReview: View {
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Text("Personal Details")
                .font(.headline)
                .padding(.top, 30)
                .padding(.horizontal, 8)
            
            ZStack {
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.black, lineWidth: 1)
                    .frame(height: 120)
                    .padding(.horizontal, 8)
                
                HStack {
                    
                    AsyncImage(url: URL(string:  userData.selectedImageUrl)) { phase in
                        if let image = phase.image {
                            image.resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 80)
                            
                        } else if phase.error == nil {
                            Image(systemName: "person.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 40, height: 40)
                        }
                    }.padding(.leading,5)
                    
                    VStack(alignment: .leading) {
                        Text("\(userData.selectedEmployee.isEmpty ? "Full Name" : userData.selectedEmployee)")
                            .font(.subheadline)
                        Text("\(userData.selectedEmployeeEmail.isEmpty ? "Email" : userData.selectedEmployeeEmail)")
                            .font(.subheadline)
                        Text(userData.selectedDate?.toFormattedString() ?? "")
                            .font(.subheadline)
                        Text("\(userData.gender)")
                            .font(.subheadline)
                    }
                    .padding()
                }
                .padding(.horizontal,16)
            }
            
            Text("Additional Information")
                .font(.headline)
                .padding(.top, 30)
                .padding(.horizontal, 16)
            
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.black, lineWidth: 1)
                    .frame(height: 80)
                    .padding(.horizontal, 8)
                
                VStack(alignment: .leading) {
                    Text(userData.selectedPreferredColor)
                        .font(.subheadline)
                    
                    Text(userData.placeOfBirth)
                        .font(.subheadline)
                    
                    Text("\(userData.residentialAddress)")
                        .font(.subheadline)
                }
                .padding(.leading, 16)
            }
            .padding(.horizontal, 8)
            
            Spacer()
            
            Button(action: {
                
                
                Task {
                }
                
            }) {
                Text("Submit")
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
            
        }.padding()
            .navigationTitle("Review")
    }
}


#Preview {
    EmployeeReview()
}
