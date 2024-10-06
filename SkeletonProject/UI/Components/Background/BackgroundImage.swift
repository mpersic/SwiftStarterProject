//
//  BackgroundImage.swift
//  SkeletonProject
//
//  Created by Matej Persic on 06.10.2024..
//

import SwiftUI

struct BackgroundImage: View {
    let imageName:String
    let isDarkOverlay : Bool
    
    init(imageName: String,
         isDarkOverlay: Bool = false) {
        self.imageName = imageName
        self.isDarkOverlay = isDarkOverlay
    }
    
    var body: some View {
        Image(imageName)
                .resizable()
                .scaledToFill()
                .if(isDarkOverlay){
                    $0.overlay(Color.black.opacity(0.75))
                }
                .edgesIgnoringSafeArea(.all)
            }
}

//#Preview {
//    BackgroundImage()
//}
