//
//  AdditionalInfoListRepository.swift
//  StaffCraft
//
//  Created by Tshikonwani, Thanyani TR on 2024/05/29.
//

import Foundation

protocol AdditionalInfoListRepository {
    func fetchAdditionalInfoList() async throws -> [AdditionalInfoList]
}

class AdditionalInfoListRepositoryImplementation: AdditionalInfoListRepository {
    
    @DependencyInjector
    private var employeeNetworkService: EmployeeNetworkService
    
    func fetchAdditionalInfoList() async throws -> [AdditionalInfoList] {
        let response: AdditionalInfoListResponse = try await employeeNetworkService.fetchData(from: "https://reqres.in/api/unknown?per_page=12",
                                                                                        as: AdditionalInfoListResponse.self)
        return response.data
    }
}
