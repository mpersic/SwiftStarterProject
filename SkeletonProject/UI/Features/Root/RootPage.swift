//
//  RootPage.swift
//  SkeletonProject
//
//  Created by Matej Persic on 06.10.2024..
//

import SwiftUI

struct RootPage: View {
    @EnvironmentObject var coordinator: NavigationCoordinator

    var body: some View {
        TabView {
            HomePage()
                .environmentObject(coordinator)
                .tabItem {
                    Label(Localizable.home, systemImage: "house")
                }

            SettingsPage()
                .environmentObject(coordinator)
                .tabItem {
                    Label(Localizable.settings, systemImage: "gear")
                }
        }
    }
}

#Preview {
    RootPage()
}
