//
//  DogsBreedsListView.swift
//  MVVMCleanArchitectureWithSwiftUI
//
//  Created by Gaurav Tak on 05/01/26.
//

import SwiftUI

struct DogsBreedsListView: View {
    @StateObject var viewModel: DogsBreedsListViewModel

    var body: some View {
        List {
            ForEach(viewModel.dogsBreeds) { breed in
                VStack(alignment: .leading, spacing: 4) {
                    Text(breed.attributes.name)
                        .font(.headline)

                    if let description = breed.attributes.description {
                        Text(description)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .lineLimit(2)
                    }

                    if let life = breed.attributes.life {
                        Text("Life span: \(life.min ?? 0) - \(life.max ?? 0) years")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                }
                .padding(.vertical, 6)
            }
        }
        .navigationTitle("Dog Breeds")
        .overlay {
            if viewModel.isLoading {
                ProgressView()
            }
        }
        .task {
            await viewModel.loadDogsBreeds(page: 1, size: 10)
        }
        .alert("Error",
               isPresented: .constant(viewModel.errorMessage != nil)) {
            Button("OK") { viewModel.errorMessage = nil }
        } message: {
            Text(viewModel.errorMessage ?? "")
        }
    }
}
