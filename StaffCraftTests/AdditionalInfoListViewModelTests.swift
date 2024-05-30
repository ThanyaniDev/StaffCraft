//
//  AdditionalInfoListViewModelTests.swift
//  StaffCraftTests
//
//  Created by Tshikonwani, Thanyani TR on 2024/05/30.
//

import XCTest
@testable import StaffCraft

class AdditionalInfoListViewModelTests: XCTestCase {
    
    var sut: AdditionalInfoListViewModel!
    var mockRepository: MockAdditionalInfoListRepository!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        mockRepository = MockAdditionalInfoListRepository()
        DependencyInjectorContainer.shared.register(mockRepository as AdditionalInfoListRepository, for: AdditionalInfoListRepository.self)
        sut = AdditionalInfoListViewModel()
    }
    
    override func tearDownWithError() throws {
        sut = nil
        mockRepository = nil
        try super.tearDownWithError()
    }
    
    func testFetchEmployees_Successful() async {
       
        let mockAdditionalInfoList: [AdditionalInfoList] = [AdditionalInfoList(id: 1, name: "namme", color: "color")]
        mockRepository.mockEmployees = mockAdditionalInfoList
        
        await sut.fetchAdditionalInfo()
        
        XCTAssertFalse(sut.isLoading)
        XCTAssertEqual(sut.additionalInfo, mockAdditionalInfoList)
        XCTAssertNil(sut.errorMessage)
    }
    
    func testFetchEmployees_Failure() async {
     
        mockRepository.shouldFail = true
        
        await sut.fetchAdditionalInfo()
        
        XCTAssertFalse(sut.isLoading)
        XCTAssertTrue(sut.additionalInfo.isEmpty)
        XCTAssertNotNil(sut.errorMessage)
    }
}

