//
//  StepOnePage.swift
//  SkeletonProject
//
//  Created by Matej Persic on 06.10.2024..
//

import Resolver
import SwiftUI

struct StepOnePage: View {
    @ObservedObject var vm: StepOneViewModel
    @EnvironmentObject var coordinator: NavigationCoordinator
    
    init(){
        vm = Resolver.resolve()
    }

    var body: some View {
        NavigationStack(path: $coordinator.path) {
            Text(Localizable.proceed)
                .onTapGesture {
                    coordinator.push(.finalStep)
                }
                .navigationDestination(for: CoordinatorScreen.self) { screen in
                    coordinator.getPage(screen)
                }
        }
    }
}

#Preview {
    StepOnePage()
}
