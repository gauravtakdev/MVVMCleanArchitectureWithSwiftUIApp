//
//  UserRepositoryImpl.swift
//  MVVMCleanArchitectureWithSwiftUI
//
//  Created by Gaurav Tak on 05/01/26.
//


final class UserRepositoryImpl: UserRepository {
    private let apiClient: APIClient
    
    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
    func fetchUsers() async throws -> [User] {
        let dto: [UserDTO] = try await apiClient.request("https://api.example.com/users")
        return dto.map { $0.toEntity() }
    }
}