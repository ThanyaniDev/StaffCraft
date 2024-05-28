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
    
    var sut: LoginViewModel!
    var mockLoginRepository: MockLoginRepository!

    override func setUp() {
        super.setUp()
        mockLoginRepository = MockLoginRepository()
        DependencyInjectorContainer.shared.register(mockLoginRepository as LoginRepository, for: LoginRepository.self)
        sut = LoginViewModel()
    }
    
    override func tearDown() {
        sut = nil
        mockLoginRepository = nil
        super.tearDown()
    }
    
    func testValidateInputs_ValidInputs() {
        sut.email = "test@example.com"
        sut.password = "password"
        
        XCTAssertTrue(sut.validateInputs())
        XCTAssertNil(sut.inputError)
    }
    
    func testValidateInputs_EmptyEmail() {
        sut.email = ""
        sut.password = "password"
        
        XCTAssertFalse(sut.validateInputs())
        XCTAssertEqual(sut.inputError?.message, "Email cannot be empty.")
    }
    
    func testValidateInputs_InvalidEmail() {
        sut.email = "invalidemail"
        sut.password = "password"
        
        XCTAssertFalse(sut.validateInputs())
        XCTAssertEqual(sut.inputError?.message, "Please enter a valid email address.")
    }
    
    func testValidateInputs_EmptyPassword() {
        sut.email = "test@example.com"
        sut.password = ""
        
        XCTAssertFalse(sut.validateInputs())
        XCTAssertEqual(sut.inputError?.message, "Password cannot be empty.")
    }
    
    func testLogin_Success() async {
        sut.email = "test@example.com"
        sut.password = "password"
        
        await sut.login()
        
        XCTAssertEqual(sut.userLoginToken, "mockToken")
        XCTAssertNil(sut.loginError)
    }
    
    func testLogin_Failure() async {
        mockLoginRepository.shouldReturnError = true
        sut.email = "test@example.com"
        sut.password = "password"
        
        await sut.login()
        
        XCTAssertEqual(sut.loginError?.message, "Invalid email or password.")
        XCTAssertEqual(sut.userLoginToken, nil)
    }
}

