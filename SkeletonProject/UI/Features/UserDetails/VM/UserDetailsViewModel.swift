//
//  UserDetailsViewModel.swift
//  SkeletonProject
//
//  Created by Matej Persic on 06.10.2024..
//

import Foundation

class UserDetailsViewModel : BaseViewModel{
    @Published var user: User
    
    init(user: User) {
        self.user = user
    }
}
