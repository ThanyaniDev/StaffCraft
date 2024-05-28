//
//  EmployeeViewModel.swift
//  StaffCraft
//
//  Created by Tshikonwani, Thanyani TR on 2024/05/28.
//

import SwiftUI

class EmployeeViewModel: ObservableObject {
    
    @Published var showAlert = false
    @Published var alertMessage = ""
    @Published var isNavigatingToNext = false
    
    func validateFields(userData: UserData) {
        if userData.selectedEmployee.isEmpty {
            alertMessage = "Please select an employee."
            showAlert = true
        } else if userData.selectedDate == nil {
            alertMessage = "Please select a date."
            showAlert = true
        } else if userData.placeOfBirth.isEmpty {
            alertMessage = "Please enter the place of birth."
            showAlert = true
        } else {
            isNavigatingToNext = true
        }
    }
}
