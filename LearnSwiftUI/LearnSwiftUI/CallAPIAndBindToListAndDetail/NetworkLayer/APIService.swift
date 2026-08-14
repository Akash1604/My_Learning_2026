//
//  APIService.swift
//  LearnSwiftUI
//
//  Created by Akash Revanna on 02/08/26.
//

import Foundation
enum DataError:Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case network(Error)
}

protocol Services {
    func request<T:Codable>(type: EndPointType) async throws -> T
}
final class APIService:Services {
    func request<T>(type: any EndPointType) async throws -> T where T : Decodable, T : Encodable {
        guard let url = type.url else {
            throw DataError.invalidURL
        }
        var request = URLRequest(url: url)
        request.httpMethod = type.httpMethod.rawValue
        if let body = type.httpBody {
            request.httpBody = try JSONEncoder().encode(body)
        }
        request.allHTTPHeaderFields = type.header
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let rawResponse = response as? HTTPURLResponse,(200...299).contains(rawResponse.statusCode) else {
            throw DataError.invalidResponse
        }
        
        return  try JSONDecoder().decode(T.self, from: data)
    }
    
    
}
