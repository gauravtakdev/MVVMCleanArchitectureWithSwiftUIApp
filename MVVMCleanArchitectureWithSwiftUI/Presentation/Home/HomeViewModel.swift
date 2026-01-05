//
//  HomeViewModel.swift
//  MVVMCleanArchitectureWithSwiftUI
//
//  Created by Gaurav Tak on 05/01/26.
//

import Foundation
import Combine

@MainActor
final class HomeViewModel: HomeViewModelProtocol {
    @Published private(set) var users: [User] = []
    private let fetchUsersUseCase: FetchUsersUseCase
    
    init(fetchUsersUseCase: FetchUsersUseCase) {
        self.fetchUsersUseCase = fetchUsersUseCase
    }
   
    func loadUsers() {
        Task {
            do {
                users = try await fetchUsersUseCase.execute()
            } catch {
                print("Error:", error)
            }
        }
    }
}
