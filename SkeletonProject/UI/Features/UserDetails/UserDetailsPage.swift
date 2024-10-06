//
//  UserDetailsPage.swift
//  SkeletonProject
//
//  Created by Matej Persic on 06.10.2024..
//

import SwiftUI
import Resolver

struct UserDetailsPage : View {
    @ObservedObject var vm: UserDetailsViewModel
    
    init(user : User) {
        vm = Resolver.resolve(args: user)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            NetworkImageView(url: URLS.mockImage)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 10)
            Text("\(Localizable.userName): \(vm.user.name)")
                .padding(.top, 16)

            Text("\(Localizable.userId): \(vm.user.id)")
                .padding(.top, 8)
        }
        .padding()
        .frame(maxWidth: UIScreen.width, maxHeight: .infinity, alignment: .top)
        .navigationTitle(Localizable.userDetails)
        .navigationBarTitleDisplayMode(.inline)
    }
}
