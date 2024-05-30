//
//  DateFormatterExtension.swift
//  StaffCraft
//
//  Created by Tshikonwani, Thanyani TR on 2024/05/30.
//

import Foundation

extension Date {
    func toFormattedString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: self)
    }
}
