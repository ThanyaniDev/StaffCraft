//
//  AdditionalInfoViewModel.swift
//  StaffCraft
//
//  Created by Tshikonwani, Thanyani TR on 2024/05/29.
//

import Foundation

class AdditionalInfoViewModel: ObservableObject {
    @Published  var selectedGender: Gender = .male
    @Published  var residentialAddress: String = ""
    @Published  var isShowingEmployeeList = false
    @Published  var isNavigatingToNext = false
    @Published  var showAlert = false
    @Published  var alertMessage = ""
    
    func validateFields(userData: UserData) {
        if userData.gender.isEmpty {
            alertMessage = "Please select a gender."
            showAlert = true
            return
        }
        
        if userData.selectedPreferredColor.isEmpty {
            alertMessage = "Please select a preferred color."
            showAlert = true
            return
        }
        
        if userData.residentialAddress.isEmpty {
            alertMessage = "Please enter a residential address."
            showAlert = true
            return
        }
        isNavigatingToNext = true
    }
}
