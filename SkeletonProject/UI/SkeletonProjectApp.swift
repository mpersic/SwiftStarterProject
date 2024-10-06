//
//  SkeletonProjectApp.swift
//  SkeletonProject
//
//  Created by Matej Persic on 23.08.2024..
//

import SwiftUI

@main
struct SkeletonProjectApp: App {
    init() {
        DIContainer.registerAllServices()
    }

    var body: some Scene {
        WindowGroup {
            SplashPage()
        }
    }
}
