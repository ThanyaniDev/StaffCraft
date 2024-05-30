//
//  EmployeeReviewViewModel.swift
//  StaffCraft
//
//  Created by Tshikonwani, Thanyani TR on 2024/05/29.
//

import SwiftUI

@MainActor
class EmployeeReviewViewModel: ObservableObject {
    @EnvironmentObject var userData: UserData
    @Published var isLoading: Bool = false
    
    @DependencyInjector
    private var employeeReviewRepository: EmployeeReviewRepository
}
