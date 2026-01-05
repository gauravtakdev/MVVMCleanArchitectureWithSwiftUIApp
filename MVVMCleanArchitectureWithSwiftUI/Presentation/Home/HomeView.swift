//
//  HomeView.swift
//  MVVMCleanArchitectureWithSwiftUI
//
//  Created by Gaurav Tak on 05/01/26.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel: HomeViewModel
    var body: some View {
        VStack {
            if viewModel.users.count > 0 {
                List(viewModel.users, id: \.id) { user in
                    Text(user.name)
                }
            } else {
                Text("No Users Found.").font(.init(.title))
            }
        }.onAppear {
            viewModel.loadUsers()
        }.navigationTitle("Home View")
    }
}
