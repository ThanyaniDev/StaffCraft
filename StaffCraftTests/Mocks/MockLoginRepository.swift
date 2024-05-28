//
//  MockLoginRepository.swift
//  StaffCraftTests
//
//  Created by Tshikonwani, Thanyani TR on 2024/05/28.
//

import XCTest
@testable import StaffCraft

class MockLoginRepository: LoginRepository {
    var shouldReturnError = false
    var loginResponse = LoginResponse(token: "mockToken")
    
    func login(request: LoginRequest) async throws -> LoginResponse {
        if shouldReturnError {
            throw NetworkError.unauthorized
        }
        return loginResponse
    }
}
