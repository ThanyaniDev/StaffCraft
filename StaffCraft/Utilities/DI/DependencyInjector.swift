//
//  DependencyInjector.swift
//  StaffCraft
//
//  Created by Tshikonwani, Thanyani TR on 2024/05/28.
//

import Foundation

@propertyWrapper
struct DependencyInjector<T> {
    private var service: T
    
    init() {
        guard let resolvedService = DependencyInjectorContainer.shared.resolve(T.self) else {
            fatalError("Dependency of type \(T.self) has not been registered.")
        }
        self.service = resolvedService
    }
    
    var wrappedValue: T {
        get { service }
        mutating set { service = newValue }
    }
}
