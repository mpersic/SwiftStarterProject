//
//  UserRepositoryProtocol.swift
//  SkeletonProject
//
//  Created by Matej Persic on 06.10.2024..
//

import Foundation

protocol UserRepositoryProtocol{
    func getUsers() async throws -> [User]
}
