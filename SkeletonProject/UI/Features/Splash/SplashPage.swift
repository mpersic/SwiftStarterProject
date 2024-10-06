//
//  SplashPage.swift
//  SkeletonProject
//
//  Created by Matej Persic on 06.10.2024..
//

import Resolver
import SwiftUI

struct SplashPage: View {
    @AppStorage("isOnboarding") var isOnboarding: Bool = true
    @StateObject var coordinator = NavigationCoordinator()
    @ObservedObject var vm: SplashViewModel
    
    init(){
        vm = Resolver.resolve()
    }

    var body: some View {
        Group {
            if vm.isInitialized {
                if isOnboarding {
                    StepOnePage()
                        .transition(.opacity)
                        .environmentObject(coordinator)
                } else {
                    RootPage()
                        .transition(.opacity)
                        .environmentObject(coordinator)
                }
            } else {
                splashScreenView()
            }
        }
        .animation(.easeInOut, value: vm.isInitialized)
    }

    @ViewBuilder
    private func splashScreenView() -> some View {
        VStack {
            Text(Localizable.splashScreenWelcome)
                .font(.largeTitle)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .transition(.opacity)
    }
}

#Preview {
    SplashPage()
}
