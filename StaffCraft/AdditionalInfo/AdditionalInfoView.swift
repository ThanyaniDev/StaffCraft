//
//  AdditionalInfoView.swift
//  StaffCraft
//
//  Created by Tshikonwani, Thanyani TR on 2024/05/28.
//

import SwiftUI

struct AdditionalInfoView: View {

    @State private var isShowingEmployeeList = false
    @StateObject private var viewModel = AdditionalInfoViewModel()
    @EnvironmentObject var userData: UserData

    var body: some View {
        VStack(alignment: .leading) {
            Text("Choose Gender")
                .font(.headline)
                .padding(.top, 50)
                .padding(.horizontal, 100)
            
            Picker("Select Gender", selection: $userData.gender) {
                ForEach(Gender.allCases) { gender in
                    Text(gender.rawValue).tag(gender)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.horizontal, 50)
            
            Text("Select employee preferred colour")
                .font(.headline)
                .padding(.top, 50)
                .padding(.leading, 8)
            
            ZStack {
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.black, lineWidth: 1)
                    .frame(height: 60)
                    .padding(.all, 8)
                
                HStack {
                    HexColorCircle(hexColor: userData.selectedPreferredHexColor)
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
                        AdditionalInfoListView().environmentObject(userData)
                    }
                }
                .padding(.horizontal, 16)
            }
            
            CustomTextField(
                text: $userData.residentialAddress,
                placeholder: "Residential Address",
                strokeColor: .black,
                lineWidth: 1,
                padding: 16,
                isSecure: false
            )
            Spacer()
        }
        .padding()
        .navigationTitle("Additional Info")
        .navigationBarItems(trailing: NavigationLink(destination: EmployeeReview().environmentObject(userData), isActive: $viewModel.isNavigatingToNext) {
            Button("Next") {
                viewModel.validateFields(userData: userData)
            }
        })
        .alert(isPresented: $viewModel.showAlert) {
            Alert(title: Text("Error"), message: Text(viewModel.alertMessage), dismissButton: .default(Text("OK")))
        }
    }
}

#Preview {
    AdditionalInfoView()
}
