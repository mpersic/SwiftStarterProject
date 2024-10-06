//
//  SettingsPage.swift
//  SkeletonProject
//
//  Created by Matej Persic on 06.10.2024..
//

import Resolver
import SwiftUI

struct SettingsPage: View {
    @AppStorage("isOnboarding") var isOnboarding: Bool = false
    @EnvironmentObject var coordinator: NavigationCoordinator
    @ObservedObject var vm: SettingsViewModel

    init() {
        vm = Resolver.resolve()
    }
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            VStack(alignment: .leading) {
                Text(Localizable.chooseLanguage)
                    .onTapGesture {
                        withAnimation {
                            coordinator.push(.language)
                        }
                    }
                    .padding(.top, 16)

                Text(Localizable.logOut)
                    .onTapGesture {
                        withAnimation {
                            isOnboarding = true
                        }
                    }
                    .padding(.top, 8)
            }
            .padding()
            .frame(maxWidth: UIScreen.width, maxHeight: .infinity, alignment: .topLeading)
            .navigationTitle(Localizable.settings)
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(for: CoordinatorScreen.self) { screen in
                coordinator.getPage(screen)
            }
        }
    }
}

#Preview {
    SettingsPage()
}
