//
//  ImageScrollingOverlay.swift
//  Swift Tinder
//
//  Created by Duong Phuong on 8/5/25.
//

import SwiftUI

struct ImageScrollingOverlay: View {
    @Binding var currentImageIndex: Int
    
    let imageCount: Int
    
    var body: some View {
        VStack() {
            HStack() {
                Rectangle()
                    .onTapGesture {updateImage(next: false)}
                Rectangle()
                    .onTapGesture {updateImage(next: true)}
            }
            .foregroundColor(.red.opacity(0.01))
        }
    }
}

private extension ImageScrollingOverlay {
    func updateImage(next: Bool) {
        if next {
            if currentImageIndex == imageCount - 1 {
                currentImageIndex = 0
            } else {
                currentImageIndex += 1
            }
        } else{
            if currentImageIndex == 0 {
                currentImageIndex = imageCount - 1
            } else {
                currentImageIndex -= 1
            }
        }
    }
}

#Preview {
    ImageScrollingOverlay(currentImageIndex: .constant(1), imageCount: 3)
}
