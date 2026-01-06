//
//  ContentView.swift
//  MVVMCleanArchitectureWithSwiftUI
//
//  Created by Gaurav Tak on 05/01/26.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var router = AppRouter()

    var body: some View {
        NavigationStack(path: $router.path) {
            VStack(spacing: 20) {

                Button("Launch Home View") {
                    router.push(.home)
                }

                Button("Launch Dogs List View") {
                    router.push(.dogsList)
                }

            }
            .padding()
            .navigationTitle("Main Menu")
            .navigationDestination(for: AppRoute.self) { route in
                switch route {
                case .home:
                    HomeView(
                        viewModel: AppContainer.shared.makeHomeViewModel()
                    )

                case .dogsList:
                    DogsBreedsListView(
                        viewModel: AppContainer.shared.makeDogsBreedsListViewModel()
                    )
                }
            }
        }
    }
}


#Preview {
    ContentView()
}
