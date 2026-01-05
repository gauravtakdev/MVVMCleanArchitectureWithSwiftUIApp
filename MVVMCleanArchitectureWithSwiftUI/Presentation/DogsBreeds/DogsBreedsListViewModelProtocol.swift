//
//  DogsBreedsListViewModelProtocol.swift
//  MVVMCleanArchitectureWithSwiftUI
//
//  Created by Gaurav Tak on 05/01/26.
//

import Foundation


protocol DogsBreedsListViewModelProtocol: ObservableObject {
    var dogsBreeds: [DogBreed] { get }
    func loadDogsBreeds(page: Int, size: Int)
    var isLoading: Bool { get  set }
    var errorMessage: String? { get  set }
}
