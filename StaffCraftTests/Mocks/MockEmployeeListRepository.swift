//
//  MockEmployeeListRepository.swift
//  StaffCraftTests
//
//  Created by Tshikonwani, Thanyani TR on 2024/05/29.
//

import XCTest
@testable import StaffCraft

class MockEmployeeListRepository: EmployeeListRepository {
    var shouldFail = false
    var mockEmployees: [EmployeeList] = []
    
    func fetchEmployeesList() async throws -> [EmployeeList] {
        if shouldFail {
            throw URLError(.badServerResponse)
        } else {
            return mockEmployees
        }
    }
}

