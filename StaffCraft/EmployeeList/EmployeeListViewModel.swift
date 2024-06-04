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
    @Published var searchText: String = ""
    
    @DependencyInjector
    private var employeeListRepository: EmployeeListRepository
    
    @MainActor
    func fetchEmployees() async {
        self.isLoading = true
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
    
  var filteredEmployees: [EmployeeList] {
        if searchText.isEmpty {
            return employees
        } else {
            return employees.filter { employee in
                employee.first_name.lowercased().contains(searchText.lowercased()) ||
                employee.email.lowercased().contains(searchText.lowercased())
            }
        }
    }
}
