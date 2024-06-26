//
//  UserData.swift
//  StaffCraft
//
//  Created by Tshikonwani, Thanyani TR on 2024/05/28.
//

import Foundation

class UserData: ObservableObject {
    @Published var id: Int = 0
    @Published var selectedEmployee: String = ""
    @Published var selectedEmployeeEmail: String = ""
    @Published var selectedDate: Date? = nil
    @Published var selectedImageUrl : String = ""
    @Published var userLoginToken: String = ""
    @Published var placeOfBirth: String = ""
    @Published var selectedPreferredColor: String = ""
    @Published var selectedPreferredHexColor: String = ""
    @Published var residentialAddress: String = ""
    @Published var gender: String = ""
    
    func reset() {
        id = 0
        selectedEmployee = ""
        selectedEmployeeEmail = ""
        selectedDate = nil
        selectedImageUrl = ""
        userLoginToken = ""
        placeOfBirth = ""
        selectedPreferredColor = ""
        selectedPreferredHexColor = ""
        residentialAddress = ""
        gender = ""
    }
}
