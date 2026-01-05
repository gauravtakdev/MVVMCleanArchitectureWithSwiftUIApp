//
//  DogBreed.swift
//  MVVMCleanArchitectureWithSwiftUI
//
//  Created by Gaurav Tak on 05/01/26.
//

import Foundation

struct DogBreedResponse: Decodable {
    let data: [DogBreed]
}

struct DogBreed: Decodable, Identifiable {
    let id: String
    let attributes: DogBreedAttributes
}

struct DogBreedAttributes: Decodable {
    let name: String
    let description: String?
    let life: LifeSpan?

    struct LifeSpan: Decodable {
        let max: Int?
        let min: Int?
    }
}
