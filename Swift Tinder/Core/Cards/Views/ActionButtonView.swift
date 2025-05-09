//
//  ActionButtonView.swift
//  Swift Tinder
//
//  Created by Duong Phuong on 9/5/25.
//

import SwiftUI

struct ActionButtonView: View {
    @ObservedObject var viewModel: CardViewModel
    
    var body: some View {
        HStack(spacing: 30) {
            Button {
                
            } label: {
                Image(.undo)
                    .background(
                        Circle()
                            .fill(.white)
                            .frame(width: 50, height: 50)
                            .shadow(radius: 6)
                    )
            }
            Button {
                viewModel.pressReject()
            } label: {
                Image(.ex)
                    .background(
                        Circle()
                            .fill(.white)
                            .frame(width: 50, height: 50)
                            .shadow(radius: 6)
                    )
            }
            Button {
                
            } label: {
                Image(.star)
                    .background(
                        Circle()
                            .fill(.white)
                            .frame(width: 50, height: 50)
                            .shadow(radius: 6)
                    )
            }
            Button {
                viewModel.pressLike()
            } label: {
                Image(.heart)
                    .background(
                        Circle()
                            .fill(.white)
                            .frame(width: 50, height: 50)
                            .shadow(radius: 6)
                    )
            }
            Button {
                
            } label: {
                Image(.boost)
                    .background(
                        Circle()
                            .fill(.white)
                            .frame(width: 50, height: 50)
                            .shadow(radius: 6)
                    )
            }
        }
    }
}

#Preview {
    ActionButtonView(viewModel: CardViewModel(service: CardService()))
}
