//
//  EmployeeListModel.swift
//  StaffCraft
//
//  Created by Tshikonwani, Thanyani TR on 2024/05/28.
//

import Foundation

struct EmployeeListResponse: Decodable {
    let data: [EmployeeList]
}

struct EmployeeList: Identifiable, Equatable, Decodable  {
    let id: Int
    let email: String
    let first_name: String
    let last_name: String
    let avatar: String
    
    static func ==(lhs: EmployeeList, rhs: EmployeeList) -> Bool {
        return lhs.id == rhs.id &&
            lhs.email == rhs.email &&
            lhs.first_name == rhs.first_name &&
            lhs.last_name == rhs.last_name &&
            lhs.avatar == rhs.avatar
    }
}
