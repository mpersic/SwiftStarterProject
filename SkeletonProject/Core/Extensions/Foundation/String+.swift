//
//  String+.swift
//  SkeletonProject
//
//  Created by Matej Persic on 06.10.2024..
//

import Foundation

extension String {
    func localized() -> String {
        return LocalizationManager.shared.localizedString(forKey: self)
    }
}
