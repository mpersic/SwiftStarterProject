//
//  NavigationCoordinator.swift
//  SkeletonProject
//
//  Created by Matej Persic on 06.10.2024..
//

import Foundation
import SwiftUI

class NavigationCoordinator: ObservableObject, Hashable{
    @Published var path: [CoordinatorScreen] = []
    
    func pop() {
        if path.isEmpty {
            return
        }
        path.removeLast()
    }

    func popToRoot() {
        if path.isEmpty {
            return
        }
        path.removeAll()
    }

    func push(_ screen: CoordinatorScreen) {
        path.append(screen)
    }
    
    @ViewBuilder
    func getPage(_ screen: CoordinatorScreen) -> some View {
        switch screen {
        case .finalStep:
            FinalStepPage()
        case .home:
            HomePage()
        case .settings:
            SettingsPage()
        case .stepOne:
            StepOnePage()
        case .language:
            LanguagePage()
        case let .userDetails(user: user):
            UserDetailsPage(user: user)
        }
    }

    static func == (lhs: NavigationCoordinator, rhs: NavigationCoordinator) -> Bool {
        return lhs.path == rhs.path
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(path)
    }
}
