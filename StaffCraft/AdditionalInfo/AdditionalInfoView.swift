//
//  AdditionalInfoView.swift
//  StaffCraft
//
//  Created by Tshikonwani, Thanyani TR on 2024/05/28.
//

import SwiftUI

struct AdditionalInfoView: View {
    @EnvironmentObject var userData: UserData
    @State private var selectedGender: Gender = .male
    @State private var residentialAddress: String = ""
    @State private var isShowingEmployeeList = false
    @State private var isNavigatingToNext = false
    
    var body: some View {
        VStack() {
            Text("Choose Gender")
                .font(.headline)
                .padding(.top, 50)
            
            Picker("Select Gender", selection: $selectedGender) {
                ForEach(Gender.allCases) { gender in
                    Text(gender.rawValue).tag(gender)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.horizontal,50)
            
            Text("Select employee preferred colour")
                .font(.headline)
                .padding(.top, 16)
                .padding(.leading, 8)
            
            ZStack {
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.black, lineWidth: 1)
                    .frame(height: 60)
                    .padding(.all, 16)
                
                HStack {
                    HexColorCircle(hexColor: userData.selectedPreferredHexColor )
                        .padding()
                    
                    VStack(alignment: .leading) {
                        Text("\(userData.selectedPreferredColor.isEmpty ? "Color Name" : userData.selectedPreferredColor)")
                            .font(.headline)
                    }
                    .padding()
                    
                    Spacer()
                    
                    Button(action: {
                        isShowingEmployeeList = true
                    }) {
                        Image(systemName: "chevron.right")
                            .padding()
                    }
                    .sheet(isPresented: $isShowingEmployeeList) {
                    }
                }
                .padding(.horizontal,16)
            }
            
            CustomTextField(
                text: $userData.residentialAddress,
                placeholder: "residential address",
                strokeColor: .black,
                lineWidth: 1,
                padding: 16,
                isSecure: false
            )
            
            Spacer()
            
        }.padding()
            .navigationTitle("Additional Info")
    }
}
#Preview {
    AdditionalInfoView()
}
