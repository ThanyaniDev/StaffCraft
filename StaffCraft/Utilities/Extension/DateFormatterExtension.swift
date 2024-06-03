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
    
    func toFormattedStringText() -> String {
          let formatter = DateFormatter()
          formatter.dateFormat = "dd MMM yyyy"
          return formatter.string(from: self)
      }
    
    func toFormattedTimeString() -> String {
           let formatter = DateFormatter()
           formatter.dateFormat = "HH:mm"
           return formatter.string(from: self)
       }
}
