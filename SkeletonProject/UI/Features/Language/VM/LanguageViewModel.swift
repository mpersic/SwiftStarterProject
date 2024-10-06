//
//  LanguageViewModel.swift
//  SkeletonProject
//
//  Created by Matej Persic on 06.10.2024..
//

import Foundation

class LanguageViewModel : BaseViewModel {
    func changeLanguage(selectedLanguage: String){
        localizationManager.setLanguage(selectedLanguage)
    }
}
