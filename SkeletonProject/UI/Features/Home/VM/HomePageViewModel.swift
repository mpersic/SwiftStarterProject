//
//  HomePageViewModel.swift
//  SkeletonProject
//
//  Created by Matej Persic on 06.10.2024..
//

import Resolver
import Foundation

class HomePageViewModel: ObservableObject {

    private let userService: UserServiceProtocol = Resolver.resolve()
    @Published var users: [User] = []

    init() {
        Task {
            await fetchUsers()
        }
    }

    func fetchUsers() async {
        do {
            let fetchedUsers = try await userService.getUsers()
            onMain {
                self.users = fetchedUsers
            }
        } catch {
            print("Failed to fetch users: \(error)")
        }
    }
}
