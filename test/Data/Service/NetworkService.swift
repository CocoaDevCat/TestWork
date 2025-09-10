//
//  NetworkService.swift
//  test
//
//  Created by Eldar Akkozov on 10/9/25.
//

import Foundation

protocol NetworkServiceProtocol {
    func post<T: Codable, U: Codable>(_ endpoint: String, body: T, responseType: U.Type) async throws -> U
}

class NetworkService: NetworkServiceProtocol {
    
    private let baseURL = "https://api.court360.ai"
    
    private var session: URLSession = {
        let session = URLSession.shared
        session.configuration.timeoutIntervalForResource = 5
        session.configuration.timeoutIntervalForRequest = 5
        return session
    }()
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    func post<T: Codable, U: Codable>(_ endpoint: String, body: T, responseType: U.Type) async throws -> U {
        return try await performRequest(endpoint, method: "POST", body: body, responseType: responseType)
    }
    
    private func performRequest<T: Codable, U: Codable>(
        _ endpoint: String,
        method: String,
        body: T,
        responseType: U.Type
    ) async throws -> U {
        guard let url = URL(string: baseURL + endpoint) else {
            throw NetworkError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try encoder.encode(body)
        
        let (data, response) = try await session.data(for: request)
        try validateResponse(response)
        
        return try decoder.decode(responseType, from: data)
    }
    
    private func validateResponse(_ response: URLResponse) throws {
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }
        
        guard 200...299 ~= httpResponse.statusCode else {
            throw NetworkError.serverError(httpResponse.statusCode)
        }
    }
}

enum NetworkError: Error, LocalizedError {
    case invalidURL
    case invalidResponse
    case serverError(Int)
    case decodingError(Error)
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Неверный URL"
        case .invalidResponse:
            return "Неверный ответ сервера"
        case .serverError(let code):
            return "Ошибка сервера: \(code)"
        case .decodingError(let error):
            return "Ошибка декодирования: \(error.localizedDescription)"
        }
    }
}
