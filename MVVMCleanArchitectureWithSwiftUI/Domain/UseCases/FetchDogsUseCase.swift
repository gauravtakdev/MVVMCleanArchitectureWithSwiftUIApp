//
//  FetchDogsUseCase.swift
//  MVVMCleanArchitectureWithSwiftUI
//
//  Created by Gaurav Tak on 05/01/26.
//

protocol FetchDogsUseCase {
    func execute(page: Int, size: Int) async throws -> [DogBreed]
}
final class FetchDogsUseCaseImpl: FetchDogsUseCase {
    private let repository: DogsRepository
    
    init(repository: DogsRepository) {
        self.repository = repository
    }
    func execute(page: Int, size: Int) async throws -> [DogBreed] {
        try await repository.fetchDogsBreeds(page: page, size: size)
    }
}
