//
//  ContentView.swift
//  SkeletonProject
//
//  Created by Matej Persic on 23.08.2024..
//

import Resolver
import SwiftUI

struct HomePage: View {

    @ObservedObject var vm : HomePageViewModel
    @EnvironmentObject var coordinator: NavigationCoordinator
    
    init(){
        vm = Resolver.resolve()
    }

    var body: some View {
        NavigationStack(path: $coordinator.path) {
            List($vm.users) { user in
                Text("\(user.id)")
                    .onTapGesture {
                        coordinator.push(.userDetails(user: user.wrappedValue))
                    }
            }
            .navigationTitle(Localizable.home)
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(for: CoordinatorScreen.self) { screen in
                coordinator.getPage(screen)
            }
        }
    }
}

struct DarkModePreview_Preview: PreviewProvider {
    static var previews: some View {
        Group {
            HomePage()
                .preferredColorScheme(.light)

            HomePage()
                .preferredColorScheme(.dark)
        }
    }
}
