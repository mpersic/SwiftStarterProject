//
//  UserServiceProtocol.swift
//  SkeletonProject
//
//  Created by Matej Persic on 06.10.2024..
//

import Foundation

protocol UserServiceProtocol {
    func getUsers() async throws -> [User] 
}
