//
//  EmployeeViewModelTests.swift
//  StaffCraftTests
//
//  Created by Tshikonwani, Thanyani TR on 2024/05/29.
//

import XCTest
@testable import StaffCraft

class EmployeeViewModelTests: XCTestCase {
    
    var sut: EmployeeViewModel!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = EmployeeViewModel()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func testValidation_EmptyEmployee() {
        let userData = UserData()
        
        sut.validateFields(userData: userData)
        
        XCTAssertTrue(sut.showAlert)
        XCTAssertEqual(sut.alertMessage, "Please select an employee.")
        XCTAssertFalse(sut.isNavigatingToNext)
    }
    
    func testValidation_NoDate() {
        let userData = UserData()
        userData.selectedEmployee = "John Doe"
        sut.validateFields(userData: userData)
        
        XCTAssertTrue(sut.showAlert)
        XCTAssertEqual(sut.alertMessage, "Please select a date.")
        XCTAssertFalse(sut.isNavigatingToNext)
    }
    
    func testValidation_EmptyPlaceOfBirth() {
        let userData = UserData()
        userData.selectedEmployee = "John Doe"
        userData.selectedDate = Date() 
      
        sut.validateFields(userData: userData)
        
        XCTAssertTrue(sut.showAlert)
        XCTAssertEqual(sut.alertMessage, "Please enter the place of birth.")
        XCTAssertFalse(sut.isNavigatingToNext)
    }
    
    func testValidation_AllFieldsValid() {
        let userData = UserData()
        userData.selectedEmployee = "John Doe"
        userData.selectedDate = Date()
        userData.placeOfBirth = "New York"
        
        sut.validateFields(userData: userData)
        
        XCTAssertFalse(sut.showAlert)
        XCTAssertTrue(sut.isNavigatingToNext)
    }
}
