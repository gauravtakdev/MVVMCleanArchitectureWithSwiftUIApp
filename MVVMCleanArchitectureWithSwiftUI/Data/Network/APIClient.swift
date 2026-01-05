//
//  APIClient.swift
//  MVVMCleanArchitectureWithSwiftUI
//
//  Created by Gaurav Tak on 05/01/26.
//

import Foundation


protocol APIClient {
    func request<T: Decodable>(_ endpoint: String) async throws -> T
}
final class URLSessionAPIClient: APIClient {
    func request<T: Decodable>(_ endpoint: String) async throws -> T {
        let url = URL(string: endpoint)!
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(T.self, from: data)
    }
}
