//
//  HomeViewModelProtocol.swift
//  MVVMCleanArchitectureWithSwiftUI
//
//  Created by Gaurav Tak on 05/01/26.
//

import Foundation


protocol HomeViewModelProtocol: ObservableObject {
    var users: [User] { get }
    func loadUsers()
}
