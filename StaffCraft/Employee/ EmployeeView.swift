//
//   EmployeeView.swift
//  StaffCraft
//
//  Created by Tshikonwani, Thanyani TR on 2024/05/28.
//

import SwiftUI

struct EmployeeView: View {
    @State private var isShowingEmployeeList = false
    @StateObject private var viewModel = EmployeeViewModel()
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text("Select an Employee")
                .font(.headline)
                .padding(.top, 50)
                .padding(.horizontal, 16)
            
            ZStack {
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.black, lineWidth: 1)
                    .frame(height: 60)
                    .padding(.horizontal, 8)
                
                HStack {
                    AsyncImage(url: URL(string: userData.selectedImageUrl)) { phase in
                        if let image = phase.image {
                            image.resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 40, height: 40)
                                .padding()
                        } else if phase.error == nil {
                            Image(systemName: "person.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 40, height: 40)
                                .padding()
                        }
                    }
                    
                    VStack(alignment: .leading) {
                        Text("\(userData.selectedEmployee.isEmpty ? "Full Name" : userData.selectedEmployee)")
                            .font(.headline)
                        
                        Text("\(userData.selectedEmployeeEmail.isEmpty ? "Email" : userData.selectedEmployeeEmail)")
                            .font(.subheadline)
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
                        EmployeeListView().environmentObject(userData)
                    }
                }
                .padding(.horizontal, 8)
            }
            
            DateTextField(date: $userData.selectedDate)
            
            CustomTextField(
                text: $userData.placeOfBirth,
                placeholder: "Place of Birth",
                strokeColor: .black,
                lineWidth: 1,
                padding: 16,
                isSecure: false
            )
            
            Spacer()
        }.padding()
        .navigationTitle("Employee")
        .navigationBarItems(trailing:
                                NavigationLink(destination: AdditionalInfoView().environmentObject(userData), isActive: $viewModel.isNavigatingToNext) {
                Button("Next") {
                    viewModel.validateFields(userData: userData)
                }
            }
        )
        .alert(isPresented: $viewModel.showAlert) {
            Alert(title: Text("Error"), message: Text(viewModel.alertMessage), dismissButton: .default(Text("OK")))
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    EmployeeView()
}
