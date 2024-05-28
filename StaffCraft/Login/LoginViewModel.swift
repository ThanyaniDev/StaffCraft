//
//  LoginViewModel.swift
//  StaffCraft
//
//  Created by Tshikonwani, Thanyani TR on 2024/05/28.
//

import SwiftUI

@MainActor
class LoginViewModel: ObservableObject {
    
    @Published var loginError: IdentifiableError?
    @Published var inputError: IdentifiableError?
    @Published var isLoading: Bool = false
    @Published var email = ""
    @Published var password = ""
    @Published var userLoginToken: String? 
    
    @DependencyInjector
    private var loginRepository: LoginRepository
    
    func login() async {
        let loginRequest = LoginRequest(email: email, password: password)
    
        isLoading = true
        defer {
            isLoading = false
        }
        do {
            let response = try await loginRepository.login(request: loginRequest)
            self.userLoginToken = response.token
            
        } catch {
            handleError(error)
        }
    }
    
    func handleError(_ error: Error) {
        if let networkError = error as? NetworkError {
            switch networkError {
            case .unauthorized:
                loginError = IdentifiableError(message: "Invalid email or password.")
            default:
                loginError = IdentifiableError(message: "An error occurred during login.")
            }
        } else {
            loginError = IdentifiableError(message: "An unknown error occurred.")
        }
    }
    
    func validateInputs() -> Bool {
        if !InputValidation.isNotEmpty(email) {
            inputError = IdentifiableError(message: "Email cannot be empty.")
            return false
        }
        
        if !InputValidation.isValidEmail(email) {
            inputError = IdentifiableError(message: "Please enter a valid email address.")
            return false
        }
        
        if !InputValidation.isNotEmpty(password) {
            inputError = IdentifiableError(message: "Password cannot be empty.")
            return false
        }
        return true
    }
}
