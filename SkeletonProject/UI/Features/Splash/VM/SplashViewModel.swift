//
//  SplashPageViewModel.swift
//  SkeletonProject
//
//  Created by Matej Persic on 06.10.2024..
//

import Foundation

class SplashViewModel: BaseViewModel {
    @Published var isInitialized: Bool = false

    init() {
        initializeApp()
    }

    private func initializeApp() async {
        try? await Task.sleep(nanoseconds: 2000000000)
        onMain {
            isInitialized = true
        }
    }
}
