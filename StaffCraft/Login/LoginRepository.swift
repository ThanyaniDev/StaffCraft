//
//  LoginRepository.swift
//  StaffCraft
//
//  Created by Tshikonwani, Thanyani TR on 2024/05/28.
//

import Foundation

protocol LoginRepository {
    func login(request: LoginRequest) async throws -> LoginResponse
}
   
class LoginRepositoryImplementation: LoginRepository {
    
    @DependencyInjector
    private var employeeNetworkService: EmployeeNetworkService
    
    func login(request: LoginRequest) async throws -> LoginResponse {
        return try await employeeNetworkService.postRequest(to: "https://reqres.in/api/login",
                                                            body: request,
                                                            as: LoginResponse.self)
    }
}
