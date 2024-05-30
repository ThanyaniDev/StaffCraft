//
//  MockAdditionalInfoListRepository.swift
//  StaffCraftTests
//
//  Created by Tshikonwani, Thanyani TR on 2024/05/30.
//

import XCTest
@testable import StaffCraft

class MockAdditionalInfoListRepository: AdditionalInfoListRepository {
    var shouldFail = false
    var mockEmployees: [AdditionalInfoList] = []
    
    func fetchAdditionalInfoList() async throws -> [AdditionalInfoList] {
        if shouldFail {
            throw URLError(.badServerResponse)
        } else {
            return mockEmployees
        }
    }
}
