//
//  UserService.swift
//  SkeletonProject
//
//  Created by Matej Persic on 06.10.2024..
//

import Foundation
import Resolver

class UserService: UserServiceProtocol {
    private let userRepository: UserRepositoryProtocol = Resolver.resolve()

    func getUsers() async throws -> [User] {
        let fetchedUsers = try await userRepository.getUsers()
        return fetchedUsers
    }
}
