//
//  Gender.swift
//  StaffCraft
//
//  Created by Tshikonwani, Thanyani TR on 2024/05/28.
//

import Foundation

enum Gender: String, CaseIterable, Identifiable {
    case male = "Male"
    case female = "Female"
    case other = "Other"
    var id: String { self.rawValue }
}
