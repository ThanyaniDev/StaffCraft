//
//  DependencyInjectorContainer.swift
//  StaffCraft
//
//  Created by Tshikonwani, Thanyani TR on 2024/05/28.
//

import Foundation

class DependencyInjectorContainer {
    static let shared = DependencyInjectorContainer()
    
    private init() {}
    
    private var pluginRegistry: [String: Any] = [:]
    private let queue = DispatchQueue(label: "DIContainer.Queue", attributes: .concurrent)
    
    func register<T>(_ service: T, for type: T.Type) {
        let key = String(describing: type)
        queue.async(flags: .barrier) {
            self.pluginRegistry[key] = service
        }
    }
    
    func resolve<T>(_ type: T.Type) -> T? {
        let key = String(describing: type)
        return queue.sync {
            return pluginRegistry[key] as? T
        }
    }
    
    func reset() {
        queue.async(flags: .barrier) {
            self.pluginRegistry.removeAll()
            
        }
    }
}
