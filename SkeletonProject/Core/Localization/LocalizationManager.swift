//
//  LocalizationManager.swift
//  SkeletonProject
//
//  Created by Matej Persic on 06.10.2024..
//

import Foundation
import SwiftUI

class LocalizationManager: ObservableObject {
    static let shared = LocalizationManager()
    private let selectedLanguageKey = "selectedLanguage"

    var availableAppLanguages: [String] = []

    @Published var selectedLanguage: String {
        didSet {
            UserDefaults.standard.set(selectedLanguage, forKey: selectedLanguageKey)
        }
    }

    init() {
        selectedLanguage = UserDefaults.standard.string(forKey: selectedLanguageKey) ?? Locale.current.language.languageCode?.identifier ?? "en"
        availableAppLanguages.append(localizedString(forKey: "croatian-string"))
        availableAppLanguages.append(localizedString(forKey: "english-string"))
    }

    func setLanguage(_ languageCode: String) {
        selectedLanguage = languageCode
    }

    func getFullLocalizedLanguageName() -> String {
        switch UserDefaults.standard.string(forKey: selectedLanguageKey) ?? "en" {
        case "hr":
            return localizedString(forKey: "croatian-string")
        default:
            return localizedString(forKey: "english-string")
        }
    }

    func localizedString(forKey key: String) -> String {
        let bundle = Bundle.main
        let path = bundle.path(forResource: selectedLanguage, ofType: "lproj")
        let localizedBundle = Bundle(path: path ?? "")
        return localizedBundle?.localizedString(forKey: key, value: nil, table: nil) ?? key
    }

    func localizedStringWithTemplate(forKey key: String, args: CVarArg...) -> String {
        let bundle = Bundle.main
        let path = bundle.path(forResource: selectedLanguage, ofType: "lproj")
        let localizedBundle = Bundle(path: path ?? "")
        let format = localizedBundle?.localizedString(forKey: key, value: nil, table: nil) ?? key
        return String(format: format, arguments: args)
    }

    func getLocalizedDateFormatter() -> DateFormatter {
        let outputDateFormatter = DateFormatter()
        outputDateFormatter.dateStyle = .long
        outputDateFormatter.timeStyle = .none
        outputDateFormatter.locale = Locale(identifier: selectedLanguage)
        return outputDateFormatter
    }

    func englishString(forKey key: String) -> String {
        let bundle = Bundle.main
        let path = bundle.path(forResource: "en", ofType: "lproj")
        let englishBundle = Bundle(path: path ?? "")
        return englishBundle?.localizedString(forKey: key, value: nil, table: nil) ?? key
    }
}
