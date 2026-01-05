//
//  DogsBreedsListViewModel.swift
//  MVVMCleanArchitectureWithSwiftUI
//
//  Created by Gaurav Tak on 05/01/26.
//

import Foundation
import Combine

@MainActor
final class DogsBreedsListViewModel: DogsBreedsListViewModelProtocol {
    
    @Published private(set) var dogsBreeds: [DogBreed] = []
    private let fetchDogsUseCase: FetchDogsUseCase
    @Published var isLoading = false
    @Published var errorMessage: String?
      
    init(fetchDogsUseCase: FetchDogsUseCase) {
        self.fetchDogsUseCase = fetchDogsUseCase
    }
   
    func loadDogsBreeds(page: Int, size: Int) {
        isLoading = true
        errorMessage = nil

        Task {
            do {
                dogsBreeds = try await fetchDogsUseCase.execute(page: page, size: size)
            } catch {
                errorMessage = error.localizedDescription
                print("Error:", error)
            }
            isLoading = false
        }
    }
}
