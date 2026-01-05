//
//  DogBreedDTO.swift
//  MVVMCleanArchitectureWithSwiftUI
//
//  Created by Gaurav Tak on 05/01/26.
//

import SwiftUI


struct DogBreedDTO: Decodable {
    let id: String
    let attributes: DogBreedAttributes
}
extension DogBreedDTO {
    func toEntity() -> DogBreed {
        DogBreed(id: id, attributes: attributes)
    }
}
