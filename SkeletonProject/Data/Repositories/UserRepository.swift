//
//  UserRepository.swift
//  SkeletonProject
//
//  Created by Matej Persic on 06.10.2024..
//

import Foundation
import Resolver

class UserRepository: UserRepositoryProtocol {
    private let networkManager: NetworkManagingProtocol = Resolver.resolve()

    func getUsers() async throws -> [User] {
        let fetchedUsers: [User] = try await networkManager.request(fromURL: URLS.getUsers!, httpMethod: .get)
        return fetchedUsers
    }
}
