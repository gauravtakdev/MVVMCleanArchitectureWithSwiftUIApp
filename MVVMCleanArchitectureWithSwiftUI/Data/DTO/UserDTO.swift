//
//  UserDTO.swift
//  MVVMCleanArchitectureWithSwiftUI
//
//  Created by Gaurav Tak on 05/01/26.
//


struct UserDTO: Decodable {
    let id: Int
    let name: String
}
extension UserDTO {
    func toEntity() -> User {
        User(id: id, name: name)
    }
}