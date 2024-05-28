//
//  StaffCraftApp.swift
//  StaffCraft
//
//  Created by Tshikonwani, Thanyani TR on 2024/05/28.
//

import SwiftUI

@main
struct StaffCraftApp: App {
    init() {
        registerDependencies()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    
    func registerDependencies() {
        DependencyInjectorContainer.shared.register(EmployeeNetworkServiceImplementation() as EmployeeNetworkService, for: EmployeeNetworkService.self)
        DependencyInjectorContainer.shared.register(LoginRepositoryImplementation() as LoginRepository, for: LoginRepository.self)
        DependencyInjectorContainer.shared.register(EmployeeListRepositoryImplementation() as EmployeeListRepository, for: EmployeeListRepository.self)
    }
}
