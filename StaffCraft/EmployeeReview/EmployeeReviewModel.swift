//
//  EmployeeReviewModel.swift
//  StaffCraft
//
//  Created by Tshikonwani, Thanyani TR on 2024/05/29.
//

import Foundation

struct EmployeeReviewRequest: Codable {
    let userLoginToken: String
    let personalDetails: EmployeePersonalDetails
    let additionalInformation: EmployeeReviewAdditionalInfo
}

struct EmployeePersonalDetails: Identifiable, Codable {
    let id: Int
    let email: String
    let first_name: String
    let last_name: String
    let avatar: String
    let DOB: String
    let gender: String
}

struct EmployeeReviewAdditionalInfo: Codable {
    let placeOfBirth: String
    let preferredColor: String
    let residentialAddress: String
}

struct EmployeeReviewResponse: Codable {
    let userLoginToken: String
    let personalDetails: EmployeePersonalDetails
    let additionalInformation: EmployeeReviewAdditionalInfo
    let id: String
    let createdAt: String
}
