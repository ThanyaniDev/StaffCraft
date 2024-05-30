//
//  EmployeeReviewRepository.swift
//  StaffCraft
//
//  Created by Tshikonwani, Thanyani TR on 2024/05/29.
//

import Foundation

protocol EmployeeReviewRepository {
    func submitEmployeeDetails(request: EmployeeReviewRequest) async throws
}
   
