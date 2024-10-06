//
//  CoordinatorScreen.swift
//  SkeletonProject
//
//  Created by Matej Persic on 06.10.2024..
//

import Foundation

enum CoordinatorScreen: Equatable, Hashable {
    case home
    case settings
    case stepOne
    case finalStep
    case language
    case userDetails(user: User)

    static func == (lhs: CoordinatorScreen, rhs: CoordinatorScreen) -> Bool {
        switch (lhs, rhs) {
        case (.home, .home):
            return true
        case (.settings, .settings):
            return true
        case (.stepOne, .stepOne):
            return true
        case (.finalStep, .finalStep):
            return true
        case (.language, .language):
            return true
        case let (.userDetails(user1), .userDetails(user2)):
            return user1 == user2
        default:
            return false
        }
    }
}
