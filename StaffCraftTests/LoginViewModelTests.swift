//
//  LoginViewModelTests.swift
//  StaffCraftTests
//
//  Created by Tshikonwani, Thanyani TR on 2024/05/28.
//

import XCTest
@testable import StaffCraft

@MainActor
class LoginViewModelTests: XCTestCase {
    
    var viewModel: LoginViewModel!
    var mockLoginRepository: MockLoginRepository!

    override func setUp() {
        super.setUp()
        mockLoginRepository = MockLoginRepository()
        DependencyInjectorContainer.shared.register(mockLoginRepository as LoginRepository, for: LoginRepository.self)
        viewModel = LoginViewModel()
    }
    
    override func tearDown() {
        viewModel = nil
        mockLoginRepository = nil
        super.tearDown()
    }
    
    func testValidateInputs_ValidInputs() {
        viewModel.email = "test@example.com"
        viewModel.password = "password"
        
        XCTAssertTrue(viewModel.validateInputs())
        XCTAssertNil(viewModel.inputError)
    }
    
    func testValidateInputs_EmptyEmail() {
        viewModel.email = ""
        viewModel.password = "password"
        
        XCTAssertFalse(viewModel.validateInputs())
        XCTAssertEqual(viewModel.inputError?.message, "Email cannot be empty.")
    }
    
    func testValidateInputs_InvalidEmail() {
        viewModel.email = "invalidemail"
        viewModel.password = "password"
        
        XCTAssertFalse(viewModel.validateInputs())
        XCTAssertEqual(viewModel.inputError?.message, "Please enter a valid email address.")
    }
    
    func testValidateInputs_EmptyPassword() {
        viewModel.email = "test@example.com"
        viewModel.password = ""
        
        XCTAssertFalse(viewModel.validateInputs())
        XCTAssertEqual(viewModel.inputError?.message, "Password cannot be empty.")
    }
    
    func testLogin_Success() async {
        viewModel.email = "test@example.com"
        viewModel.password = "password"
        
        await viewModel.login()
        
        XCTAssertEqual(viewModel.userLoginToken, "mockToken")
        XCTAssertNil(viewModel.loginError)
    }
    
    func testLogin_Failure() async {
        mockLoginRepository.shouldReturnError = true
        viewModel.email = "test@example.com"
        viewModel.password = "password"
        
        await viewModel.login()
        
        XCTAssertEqual(viewModel.loginError?.message, "Invalid email or password.")
        XCTAssertEqual(viewModel.userLoginToken, "")
    }
}

