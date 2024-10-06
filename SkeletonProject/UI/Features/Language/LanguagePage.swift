//
//  LanguagePage.swift
//  SkeletonProject
//
//  Created by Matej Persic on 06.10.2024..
//

import Resolver
import SwiftUI

struct LanguagePage: View {
    @ObservedObject var vm: LanguageViewModel
    @ObservedObject var localizationManager = LocalizationManager.shared

    init(){
        vm = Resolver.resolve()
    }

    var body: some View {
        VStack(alignment: .leading) {
            Text(Localizable.english)
                .onTapGesture {
                    localizationManager.setLanguage("en")
                }
                .padding(.top, 16)

            Text(Localizable.croatian)
                .onTapGesture {
                    localizationManager.setLanguage("hr")
                }
                .padding(.top, 8)
        }
        .padding()
        .frame(maxWidth: UIScreen.width, maxHeight: .infinity, alignment: .topLeading)
        .navigationTitle(Localizable.language)
        .navigationBarTitleDisplayMode(.inline)
    }
}
