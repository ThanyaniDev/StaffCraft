//
//  EmployeeListView.swift
//  StaffCraft
//
//  Created by Tshikonwani, Thanyani TR on 2024/05/28.
//

import SwiftUI

struct EmployeeListView: View {
   
    @State private var searchText: String = ""
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var userData: UserData
    
    @StateObject private var viewModel = EmployeeListViewModel()
    
    private var filteredEmployees: [EmployeeList] {
        if searchText.isEmpty {
            return viewModel.employees
        } else {
            return viewModel.employees.filter { employee in
                employee.first_name .lowercased().contains(searchText.lowercased()) ||
                employee.email.lowercased().contains(searchText.lowercased())
            }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                if viewModel.isLoading {
                    ProgressView("Loading...")
                        .progressViewStyle(CircularProgressViewStyle())
                        .padding()
                } else {
                    if let errorMessage = viewModel.errorMessage {
                        Text(errorMessage)
                            .foregroundColor(.red)
                            .padding()
                    } else {
                        HStack(alignment: .firstTextBaseline){
                            Spacer()
                            Text("Select an Employee")
                                .font(.headline)
                                .padding(.top)
                            Spacer()
                        }
                        
                        VStack {
                            TextField("Find an employee", text: $searchText)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding()
                            
                            List(filteredEmployees) { employee in
                                Button(action: {
                                    userData.selectedEmployee = "\(employee.first_name) \(employee.last_name)"
                                    userData.selectedEmployeeEmail = employee.email
                                    userData.selectedImageUrl = employee.avatar
                                    
                                    presentationMode.wrappedValue.dismiss()
                                }) {
                                    HStack() {
                                        AsyncImage(url: URL(string: employee.avatar)) { phase in
                                            if let image = phase.image {
                                                image.resizable()
                                                    .aspectRatio(contentMode: .fit)
                                                    .frame(width: 35, height: 35)
                                                    .padding(.trailing, 8)
                                            } else if phase.error != nil {
                                                Image(systemName: "person.fill")
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fit)
                                                    .frame(width: 35, height: 35)
                                                    .padding(.trailing, 8)
                                            } else {
                                                ProgressView()
                                                    .frame(width: 35, height: 35)
                                                    .padding(.trailing, 8)
                                            }
                                        }
                                        
                                        VStack(alignment: .leading) {
                                            Text("\(employee.first_name)  \(employee.last_name)")
                                                .font(.headline)
                                            Text(employee.email)
                                                .font(.subheadline)
                                                .foregroundColor(.gray)
                                        }
                                    }
                                }
                                
                            }
                            .listStyle(PlainListStyle())
                        }
                    }
                }
            }
            .task {
                await viewModel.fetchEmployees()
            }
        }
    }
}

#Preview {
    EmployeeListView()
}

