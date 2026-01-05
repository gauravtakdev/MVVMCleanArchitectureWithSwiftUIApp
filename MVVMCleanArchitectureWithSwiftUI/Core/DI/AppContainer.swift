//
//  AppContainer.swift
//  MVVMCleanArchitectureWithSwiftUI
//
//  Created by Gaurav Tak on 05/01/26.
//


final class AppContainer {
    static let shared = AppContainer()
    private lazy var apiClient = URLSessionAPIClient()
    private lazy var userRepository = UserRepositoryImpl(apiClient: apiClient)
    private lazy var fetchUsersUseCase = FetchUsersUseCaseImpl(repository: userRepository)
    private lazy var dogsRepository = DogsRepositoryImpl(apiClient: apiClient)
    private lazy var fetchDogsUseCase = FetchDogsUseCaseImpl(repository: dogsRepository)
   
    func makeHomeViewModel() -> HomeViewModel {
        HomeViewModel(fetchUsersUseCase: fetchUsersUseCase)
    }
    func makeDogsBreedsListViewModel() -> DogsBreedsListViewModel {
        DogsBreedsListViewModel(fetchDogsUseCase: fetchDogsUseCase)
    }
}