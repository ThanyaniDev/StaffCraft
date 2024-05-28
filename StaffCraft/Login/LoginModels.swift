//
//  LoginModels.swift
//  StaffCraft
//
//  Created by Tshikonwani, Thanyani TR on 2024/05/28.
//

import Foundation

struct LoginRequest: Encodable {
    let email: String
    let password: String
}

struct LoginResponse: Decodable {
    let token: String
}

struct IdentifiableError: Identifiable {
    let id = UUID()
    let message: String
}
