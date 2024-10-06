//
//  DIContainer.swift
//  SkeletonProject
//
//  Created by Matej Persic on 06.10.2024..
//

import Resolver

class DIContainer {
    static func registerAllServices() {
        Resolver.register {
            NetworkManager() as NetworkManagingProtocol
        }
        Resolver.register {
            UserRepository() as UserRepositoryProtocol
        }
        Resolver.register {
            UserService() as UserServiceProtocol
        }
        Resolver.register {
            HomePageViewModel()
        }
        Resolver.register {
            LanguageViewModel()
        }
        Resolver.register {
            StepOneViewModel()
        }
        Resolver.register {
            FinalStepViewModel()
        }
        Resolver.register {
            SettingsViewModel()
        }
        Resolver.register {
            SplashViewModel()
        }
        Resolver.register { _, args in
            UserDetailsViewModel(user: args())
        }
    }
}
