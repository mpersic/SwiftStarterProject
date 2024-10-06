//
//  AppInfoService.swift
//  SkeletonProject
//
//  Created by Matej Persic on 06.10.2024..
//

import Foundation

class AppInfoService{
    static func getAppVersionAndBuildNumber() -> String? {
        if let infoDictionary = Bundle.main.infoDictionary {
            if let version = infoDictionary["CFBundleShortVersionString"] as? String,
               let build = infoDictionary["CFBundleVersion"] as? String {
                return "v-\(version)-b\(build)"
            }
        }
        return nil
    }
}
