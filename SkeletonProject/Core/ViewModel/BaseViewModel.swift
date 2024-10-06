//
//  BaseViewModel.swift
//  SkeletonProject
//
//  Created by Matej Persic on 06.10.2024..
//

import SwiftUI
class BaseViewModel: ObservableObject {
    
    @Published var isBusy = false
    @ObservedObject var localizationManager = LocalizationManager.shared
    @ObservedObject var networkMonitor = NetworkMonitor.shared
    
    func getLocalizedString(forKey key: String) -> String {
        return localizationManager.localizedString(forKey: key)
    }
    
    func onAppear() {
    }
    
    func onDisappear() {
    }
    
    func getIsConnectedToInternet() -> Bool {
        return networkMonitor.isConnected
    }
}
