//
//  FetchUsersUseCase.swift
//  MVVMCleanArchitectureWithSwiftUI
//
//  Created by Gaurav Tak on 05/01/26.
//


protocol FetchUsersUseCase {
    func execute() async throws -> [User]
}
final class FetchUsersUseCaseImpl: FetchUsersUseCase {
    private let repository: UserRepository
    init(repository: UserRepository) {
        self.repository = repository
    }
    func execute() async throws -> [User] {
        try await repository.fetchUsers()
    }
}