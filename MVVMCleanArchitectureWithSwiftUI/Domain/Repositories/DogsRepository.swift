//
//  DogsRepository.swift
//  MVVMCleanArchitectureWithSwiftUI
//
//  Created by Gaurav Tak on 05/01/26.
//

protocol DogsRepository {
    func fetchDogsBreeds(page: Int, size: Int) async throws -> [DogBreed]
}
