//
//  AdditionalInfoViewModelTests.swift
//  StaffCraftTests
//
//  Created by Tshikonwani, Thanyani TR on 2024/05/30.
//

import XCTest
@testable import StaffCraft

class AdditionalInfoViewModelTests: XCTestCase {
    var sut: AdditionalInfoViewModel!
    var userData: UserData!
   
    override func setUp() {
        super.setUp()
        sut = AdditionalInfoViewModel()
        userData = UserData()
    }
    
    override func tearDown() {
        sut = nil
        userData = nil
        super.tearDown()
    }
    
    func testValidateFields_noGenderSelected_showsAlert() {
        userData.gender = ""
 
        sut.validateFields(userData: userData)

        XCTAssertTrue(sut.showAlert)
        XCTAssertEqual(sut.alertMessage, "Please select a gender.")
        XCTAssertFalse(sut.isNavigatingToNext)
    }
    
    func testValidateFields_noPreferredColorSelected_showsAlert() {
        userData.gender = "Male"
        userData.selectedPreferredColor = ""
        
        sut.validateFields(userData: userData)
        
        // Then
        XCTAssertTrue(sut.showAlert)
        XCTAssertEqual(sut.alertMessage, "Please select a preferred color.")
        XCTAssertFalse(sut.isNavigatingToNext)
    }
    
    func testValidateFields_noResidentialAddressEntered_showsAlert() {
        userData.gender = "Male"
        userData.selectedPreferredColor = "Blue"
        userData.residentialAddress = ""
    
        sut.validateFields(userData: userData)
        
        XCTAssertTrue(sut.showAlert)
        XCTAssertEqual(sut.alertMessage, "Please enter a residential address.")
        XCTAssertFalse(sut.isNavigatingToNext)
    }
    
    func testValidateFields_allFieldsValid_navigatesToNext() {
        userData.gender = "Male"
        userData.selectedPreferredColor = "Blue"
        userData.residentialAddress = "123 Main St"
        
        sut.validateFields(userData: userData)
      
        XCTAssertFalse(sut.showAlert)
        XCTAssertEqual(sut.alertMessage, "")
        XCTAssertTrue(sut.isNavigatingToNext)
    }
}
