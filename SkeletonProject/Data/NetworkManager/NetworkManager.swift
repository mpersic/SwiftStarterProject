//
//  NetworkManager.swift
//  SkeletonProject
//
//  Created by Matej Persic on 06.10.2024..
//

import Foundation

enum ManagerErrors: Error {
    case invalidResponse
    case invalidStatusCode(Int)
}

protocol NetworkManagingProtocol {
    func request<T: Decodable>(fromURL url: URL, httpMethod: NetworkManager.HttpMethod) async throws -> T
}

class NetworkManager: NetworkManagingProtocol {
    enum HttpMethod: String {
        case get
        case post

        var method: String { rawValue.uppercased() }
    }

    /// Request data from an endpoint
    /// - Parameters:
    ///   - url: the URL
    ///   - httpMethod: The HTTP Method to use, either get or post in this case
    /// - Returns: The decoded object of the generic type or throws an error
    func request<T: Decodable>(fromURL url: URL, httpMethod: HttpMethod = .get) async throws -> T {
        // Create the request. On the request you can define if it is a GET or POST request, add body and more.
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod.method

        let (data, response) = try await URLSession.shared.data(for: request)

        guard let urlResponse = response as? HTTPURLResponse else {
            throw ManagerErrors.invalidResponse
        }
        if !(200 ..< 300).contains(urlResponse.statusCode) {
            throw ManagerErrors.invalidStatusCode(urlResponse.statusCode)
        }

        do {
            let decodedData = try JSONDecoder().decode(T.self, from: data)
            return decodedData
        } catch {
            debugPrint("Could not translate the data to the requested type. Reason: \(error)")
            throw error
        }
    }
}

class MockNetworkManager: NetworkManagingProtocol {
    var mockData: Data?
    var error: Error?

    func request<T: Decodable>(fromURL url: URL, httpMethod: NetworkManager.HttpMethod) async throws -> T {
        if let error = error {
            throw error
        }

        if let mockData = mockData {
            return try JSONDecoder().decode(T.self, from: mockData)
        }

        throw ManagerErrors.invalidResponse
    }
}
