//
//  FinalStepPage.swift
//  SkeletonProject
//
//  Created by Matej Persic on 06.10.2024..
//

import Resolver
import SwiftUI

struct FinalStepPage: View {
    @AppStorage("isOnboarding") var isOnboarding: Bool?
    @EnvironmentObject var coordinator: NavigationCoordinator
    @ObservedObject var vm: FinalStepViewModel

    init() {
        vm = Resolver.resolve()
    }

    var body: some View {
        CustomButton(buttonText: Localizable.letsGo,
                     tappedAction: finishOnboarding)
    }

    func finishOnboarding() {
        coordinator.popToRoot()
        withAnimation {
            isOnboarding = false
        }
    }
}

#Preview {
    FinalStepPage()
}
