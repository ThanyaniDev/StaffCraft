//
//  EmployeeReviewModel.swift
//  StaffCraft
//
//  Created by Tshikonwani, Thanyani TR on 2024/05/29.
//

import Foundation

struct EmployeeReviewRequest: Decodable {
    let userLoginToken: String
    let personalDetails: EmployeePersonalDetails
    let additionalInformation: EmployeeReviewAdditionalInfo
}

struct EmployeePersonalDetails: Identifiable, Decodable {
    let id: Int
    let email: String
    let first_name: String
    let last_name: String
    let avatar: String
    let DOB: String
    let gender: String
}

struct EmployeeReviewAdditionalInfo: Decodable {
    let placeOfBirth: String
    let preferredColor: String
    let residentialAddress: String
}

struct EmployeePersonalDetailResponse: Decodable {
    let first_name: String
    let last_name: String
    let preferredColor: String
    let residentialAddress: String
}
