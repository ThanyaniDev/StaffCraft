//
//  LoginView.swift
//  StaffCraft
//
//  Created by Tshikonwani, Thanyani TR on 2024/05/28.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject private var viewModel = LoginViewModel()
    @State private var isLoginSuccessful = false
    @State private var isLoginFailed = false
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                if viewModel.isLoading {
                    ProgressView("Logging in...")
                        .padding()
                }  else {
                    if  let error = viewModel.loginError {
                        NavigationLink(destination: StatusView(status: .failure, headline:"LOGIN ERROR", subheadline: error.message), isActive: $isLoginFailed) {
                            EmptyView()
                        }
                    } else {
                        Image(systemName:"person.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                            .padding()
                        
                        Text("Employee")
                            .font(.headline)
                            .foregroundColor(.gray)
                        
                        CustomTextField(
                            text: $viewModel.email,
                            placeholder: "Enter email",
                            strokeColor: .black,
                            lineWidth: 1,
                            padding: 16,
                            isSecure: false
                        )
                        .autocapitalization(.none)
                        .keyboardType(.emailAddress)
                        
                        CustomTextField(
                            text: $viewModel.password,
                            placeholder: "Enter password",
                            strokeColor: .black,
                            lineWidth: 1,
                            padding: 16,
                            isSecure: true
                        )
                        
                        Button(action: {
                            if viewModel.validateInputs() {
                                Task {
                                    await viewModel.login()
                                    
                                    if viewModel.userLoginToken != nil {
                                        isLoginSuccessful = true
                                        self.userData.userLoginToken = viewModel.userLoginToken ?? ""
                                    }
                                }
                            }
                        }) {
                            Text("Login")
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
                        NavigationLink(destination: EmployeeView(), isActive: $isLoginSuccessful) {
                            EmptyView()
                        }
                    }
                }
            }
            .padding()
            .alert(item: $viewModel.inputError) { error in
                Alert(title: Text("Error"), message: Text(error.message), dismissButton: .default(Text("OK")))
            }
        }
    }
}
