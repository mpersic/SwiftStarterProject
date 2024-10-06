//
//  User.swift
//  SkeletonProject
//
//  Created by Matej Persic on 06.10.2024..
//

import Foundation

struct User: Decodable, Identifiable, Equatable, Hashable {
    let id: Int
    let name: String
}
