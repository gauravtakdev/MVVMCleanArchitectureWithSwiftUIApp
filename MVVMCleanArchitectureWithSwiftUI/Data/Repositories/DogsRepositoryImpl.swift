//
//  DogsRepository.swift
//  MVVMCleanArchitectureWithSwiftUI
//
//  Created by Gaurav Tak on 05/01/26.
//

import Foundation

final class DogsRepositoryImpl: DogsRepository {
    
    private let apiClient: APIClient
    
    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
    
    func fetchDogsBreeds(page: Int = 1, size: Int = 10) async throws -> [DogBreed] {
        var components = URLComponents(string: "https://dogapi.dog/api/v2/breeds")!
        components.queryItems = [
            URLQueryItem(name: "page[number]", value: "\(page)"),
            URLQueryItem(name: "page[size]", value: "\(size)")
        ]
        
        let url = components.url!
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
              200..<300 ~= httpResponse.statusCode else {
            throw URLError(.badServerResponse)
        }
        
        return try JSONDecoder().decode(DogBreedResponse.self, from: data).data
    }
}
