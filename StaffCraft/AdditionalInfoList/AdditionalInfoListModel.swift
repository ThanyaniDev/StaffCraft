//
//  AdditionalInfoListModel.swift
//  StaffCraft
//
//  Created by Tshikonwani, Thanyani TR on 2024/05/29.
//

import Foundation

struct AdditionalInfoListResponse: Decodable {
    let data: [AdditionalInfoList]
}

struct AdditionalInfoList: Identifiable, Equatable, Decodable  {
    let id: Int
    let name: String
    let color: String
    
    static func ==(lhs: AdditionalInfoList, rhs: AdditionalInfoList) -> Bool {
        return lhs.id == rhs.id &&
            lhs.name == rhs.name &&
            lhs.color == rhs.color
    }
}
