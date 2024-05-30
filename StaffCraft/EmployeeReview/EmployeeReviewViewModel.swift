//
//  EmployeeReviewViewModel.swift
//  StaffCraft
//
//  Created by Tshikonwani, Thanyani TR on 2024/05/29.
//

import SwiftUI

@MainActor
class EmployeeReviewViewModel: ObservableObject {
    
    @Published var isLoading: Bool = false
    @Published var successSubHeader:  String? = nil
    @Published var errorMessage: String? = nil
    @Published var isCreadted: String?
  
    @DependencyInjector
    private var employeeReviewRepository: EmployeeReviewRepository
    
    @MainActor
    func submitEmployeeDetails(userData: UserData) async {
        let employeeReviewRequest = EmployeeReviewRequest(userLoginToken: userData.userLoginToken,
                                                          personalDetails: EmployeePersonalDetails(id: userData.id,
                                                                                                   email: userData.selectedEmployeeEmail,
                                                                                                   first_name: userData.selectedEmployee,
                                                                                                   last_name: userData.selectedEmployee,
                                                                                                   avatar: userData.selectedImageUrl,
                                                                                                   DOB: userData.selectedDate?.toFormattedString() ?? "",
                                                                                                   gender: userData.gender),
                                                          additionalInformation: EmployeeReviewAdditionalInfo(placeOfBirth: userData.placeOfBirth,
                                                                                                              preferredColor: userData.selectedPreferredColor,
                                                                                                              residentialAddress: userData.residentialAddress))
       
        isLoading = true
        defer {
            isLoading = false
        }
        
        do {
            let response = try await employeeReviewRepository.submitEmployeeDetails(request: employeeReviewRequest)
            self.isCreadted = response.createdAt
            self.successSubHeader =  "Congratulations you have successfully updated personal details and additional details for \(response.personalDetails.first_name) on \(userData.selectedDate?.toFormattedStringText() ?? "") at \(userData.selectedDate?.toFormattedTimeString() ?? "")"
        } catch {
            self.errorMessage = "Failed to load employees: \(error.localizedDescription)"
        }
    }

}
