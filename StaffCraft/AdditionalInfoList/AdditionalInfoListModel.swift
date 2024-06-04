//
//  AdditionalInfoListModel.swift
//  StaffCraft
//
//  Created by Tshikonwani, Thanyani TR on 2024/05/29.
//

import Foundation

struct AdditionalInfoListResponse: Codable {
    let data: [AdditionalInfoList]
}

struct AdditionalInfoList: Identifiable, Equatable, Codable  {
    let id: Int
    let name: String
    let color: String
    
    static func ==(lhs: AdditionalInfoList, rhs: AdditionalInfoList) -> Bool {
        return lhs.id == rhs.id &&
            lhs.name == rhs.name &&
            lhs.color == rhs.color
    }
}
