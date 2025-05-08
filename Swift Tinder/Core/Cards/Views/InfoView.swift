//
//  InfoView.swift
//  Swift Tinder
//
//  Created by Duong Phuong on 8/5/25.
//

import SwiftUI

struct InfoView: View {
    var body: some View {
        HStack(alignment: VerticalAlignment.center) {
            VStack {
                HStack(alignment: VerticalAlignment.center) {
                    Text("Paulo").fontWeight(.bold).font(.system(size: 38)).lineLimit(1)
                    Text("29").font(.system(size: 25))
                }
                HStack {
                    Image(.residence)
                    Text("Live in Alfama").font(.system(size: 16))
                        .lineLimit(1)
                }
                HStack {
                    Image(.location)
                    Text("Live in Alfama").font(.system(size: 16))
                        .lineLimit(1)
                }
            }
            Spacer()
            Image(.info)
        }
        .padding()
        .foregroundColor(.white)
        .background(LinearGradient(colors: [.black, .clear], startPoint: .bottom, endPoint: .top))
    }
}

#Preview {
    InfoView()
}
