//
//  EmployeeListRepository.swift
//  StaffCraft
//
//  Created by Tshikonwani, Thanyani TR on 2024/05/28.
//

import Foundation

protocol EmployeeListRepository {
    func fetchEmployeesList() async throws -> [EmployeeList]
}

class EmployeeListRepositoryImplementation: EmployeeListRepository {
    @DependencyInjector
    private var employeeNetworkService: EmployeeNetworkService
    
    func fetchEmployeesList() async throws -> [EmployeeList] {
        let response: EmployeeListResponse = try await employeeNetworkService.fetchData(from: "https://reqres.in/api/users?page=1&per_page=12",
                                                                                        as: EmployeeListResponse.self)
        return response.data
    }
}
