//
//  UserRepository.swift
//  MVVMCleanArchitectureWithSwiftUI
//
//  Created by Gaurav Tak on 05/01/26.
//

protocol UserRepository {
    func fetchUsers() async throws -> [User]
}
