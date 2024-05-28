//
//  EmployeeNetworkService.swift
//  StaffCraft
//
//  Created by Tshikonwani, Thanyani TR on 2024/05/28.
//

import Foundation

protocol EmployeeNetworkService {
    func fetchData<T: Decodable>(from urlString: String, as type: T.Type) async throws -> T
    func postRequest<T: Decodable, U: Encodable>(to urlString: String, body: U, as type: T.Type) async throws -> T
}

class EmployeeNetworkServiceImplementation: EmployeeNetworkService  {
   
    func fetchData<T: Decodable>(from urlString: String, as type: T.Type) async throws -> T {
        guard let url = URL(string: urlString) else {
            throw NetworkError.badURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkError.requestFailed
        }
        
        do {
            let decodedData = try JSONDecoder().decode(T.self, from: data)
            return decodedData
        } catch {
            throw NetworkError.decodingError
        }
    }
    
    func postRequest<T: Decodable, U: Encodable>(to urlString: String, body: U, as type: T.Type) async throws -> T {
        guard let url = URL(string: urlString) else {
            throw NetworkError.badURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let jsonData = try JSONEncoder().encode(body)
            request.httpBody = jsonData
        } catch {
            throw NetworkError.encodingError
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkError.invalidResponse
            }
            
            switch httpResponse.statusCode {
            case 200...299:
                do {
                    let decodedData = try JSONDecoder().decode(T.self, from: data)
                    return decodedData
                } catch {
                    throw NetworkError.decodingError
                }
            case 401:
                throw NetworkError.unauthorized
            default:
                throw NetworkError.serverError(httpResponse.statusCode)
            }
        } catch {
            if let urlError = error as? URLError, urlError.code == .notConnectedToInternet {
                throw NetworkError.noInternetConnection
            } else {
                throw NetworkError.requestFailed
            }
        }
    }
}
