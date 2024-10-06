//
//  NetworkMonitor.swift
//  SkeletonProject
//
//  Created by Matej Persic on 06.10.2024..
//

import Foundation
import Network

class NetworkMonitor : ObservableObject{
    private let networkMonitor = NWPathMonitor()
    private let workerQueue = DispatchQueue(label: "Monitor")
    var isConnected = false
    static let shared = NetworkMonitor()
    
    init() {
        networkMonitor.pathUpdateHandler = { path in
            self.isConnected = path.status == .satisfied
        }
        networkMonitor.start(queue: workerQueue)
    }
}
