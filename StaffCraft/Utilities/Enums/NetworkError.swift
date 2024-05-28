//
//  NetworkError.swift
//  StaffCraft
//
//  Created by Tshikonwani, Thanyani TR on 2024/05/28.
//

import Foundation

enum NetworkError: Error {
    case badURL
    case encodingError
    case requestFailed
    case invalidResponse
    case decodingError
    case unauthorized
    case serverError(Int)
    case noInternetConnection
}
