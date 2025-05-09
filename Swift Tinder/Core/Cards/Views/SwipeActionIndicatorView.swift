//
//  SwipeActionIndicatorView.swift
//  Swift Tinder
//
//  Created by Duong Phuong on 8/5/25.
//

import SwiftUI

struct SwipeActionIndicatorView: View {
    @Binding var xOffset: CGFloat
    
    var body: some View {
        HStack() {
            Text("LIKE")
                .font(.title)
                .fontWeight(.heavy)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(.green, lineWidth: 5).frame(width: 100, height: 48))
                .foregroundColor(.green)
                .rotationEffect(.degrees(-45))
                .opacity(Double(xOffset/SizeConstants.screenCutOff))
            Spacer()
            Text("NOPE")
                .font(.title)
                .fontWeight(.heavy)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(.red, lineWidth: 5).frame(width: 100, height: 48))
                .foregroundColor(.red)
                .rotationEffect(.degrees(45))
                .opacity(Double(xOffset/SizeConstants.screenCutOff) * -1)
        }
        .padding(40)
    }
}

#Preview {
    SwipeActionIndicatorView(xOffset: .constant(0))
}
