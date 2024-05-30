//
//  EmployeeListViewModelTests.swift
//  StaffCraftTests
//
//  Created by Tshikonwani, Thanyani TR on 2024/05/29.
//

import XCTest
@testable import StaffCraft

class EmployeeListViewModelTests: XCTestCase {
    
    var viewModel: EmployeeListViewModel!
    var mockRepository: MockEmployeeListRepository!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        mockRepository = MockEmployeeListRepository()
        DependencyInjectorContainer.shared.register(mockRepository as EmployeeListRepository, for: EmployeeListRepository.self)
        viewModel = EmployeeListViewModel()
    }
    
    override func tearDownWithError() throws {
        viewModel = nil
        mockRepository = nil
        try super.tearDownWithError()
    }
    
    func testFetchEmployees_Successful() async {
       
        let mockEmployees: [EmployeeList] = [EmployeeList(id: 1,
                                                          email: "george.bluth@reqres.in",
                                                          first_name: "George",
                                                          last_name: "Bluth",
                                                          avatar: "https://reqres.in/img/faces/1-image.jpg"
                                                         )]
        mockRepository.mockEmployees = mockEmployees
        
        await viewModel.fetchEmployees()
        
        XCTAssertFalse(viewModel.isLoading)
        XCTAssertEqual(viewModel.employees, mockEmployees)
        XCTAssertNil(viewModel.errorMessage)
    }
    
    func testFetchEmployees_Failure() async {
     
        mockRepository.shouldFail = true
        
        await viewModel.fetchEmployees()
        
        XCTAssertFalse(viewModel.isLoading)
        XCTAssertTrue(viewModel.employees.isEmpty)
        XCTAssertNotNil(viewModel.errorMessage)
    }
}
