//
//  NetworkImageView.swift
//  SkeletonProject
//
//  Created by Matej Persic on 06.10.2024..
//

import SwiftUI

struct NetworkImageView: View {
    let url: URL?

    var body: some View {
        AsyncImage(url: url) { phase in
            switch phase {
            case .empty:
                ProgressView()
                    .frame(width: 250, height: 250)
            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250, height: 250)
                    .clipShape(Circle())
            case .failure:
                Image(systemName: "exclamationmark.triangle") 
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250, height: 250)
            @unknown default:
                EmptyView()
                    .frame(width: 250, height: 250)
            }
        }
    }
}
