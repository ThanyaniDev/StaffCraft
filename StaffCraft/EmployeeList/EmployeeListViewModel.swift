//
//  EmployeeListViewModel.swift
//  StaffCraft
//
//  Created by Tshikonwani, Thanyani TR on 2024/05/28.
//

import SwiftUI

class EmployeeListViewModel: ObservableObject {
   
    @Published var employees: [EmployeeList] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    @DependencyInjector
    private var employeeListRepository: EmployeeListRepository
    
    @MainActor
    func fetchEmployees() async {
        isLoading = true
        defer {
            self.isLoading = false
        }
        
        do {
            let employeesList = try await employeeListRepository.fetchEmployeesList()
            self.employees = employeesList
        } catch {
            self.errorMessage = "Failed to load employees: \(error.localizedDescription)"
        }
    }
}
