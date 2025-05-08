//
//  CardImageIndicatorView.swift
//  Swift Tinder
//
//  Created by Duong Phuong on 8/5/25.
//

import SwiftUI

struct CardImageIndicatorView: View {
    @Binding var currentImageIndex: Int
    let imageCount: Int
    var body: some View {
        HStack() {
            ForEach(0..<imageCount, id: \.self) {index in
                Capsule()
                    .frame(width: indicatorWidth, height: 4)
                    .foregroundColor(currentImageIndex == index ? .white : .white.opacity(0.5))
                    .padding(.top, 14)
            }
        }
    }
}

private extension CardImageIndicatorView {
    var indicatorWidth: CGFloat {
        return SizeConstants.cardWidth / CGFloat(imageCount) - 28
    }
}

#Preview {
    CardImageIndicatorView(currentImageIndex: .constant(1),imageCount: 3)
}
