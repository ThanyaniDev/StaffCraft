//
//  EmployeeReviewRepository.swift
//  StaffCraft
//
//  Created by Tshikonwani, Thanyani TR on 2024/05/29.
//

import Foundation

protocol EmployeeReviewRepository {
    func submitEmployeeDetails(request: EmployeeReviewRequest) async throws -> EmployeeReviewResponse
}

class EmployeeReviewRepositoryImplementation: EmployeeReviewRepository {
    
    @DependencyInjector
    private var employeeNetworkService: EmployeeNetworkService
    
    func submitEmployeeDetails(request: EmployeeReviewRequest) async throws -> EmployeeReviewResponse {
        return try await employeeNetworkService.postRequest(to: "https://reqres.in/api/users", 
                                                            body: request,
                                                            as: EmployeeReviewResponse.self)
    }
}
   
