//
//  CardView.swift
//  Swift Tinder
//
//  Created by Duong Phuong on 8/5/25.
//

import SwiftUI

struct CardView: View {
    @ObservedObject var viewModel: CardViewModel
    @State private var xOffset: CGFloat = 0
    @State private var degrees: Double = 0
    @State private var currentOffset: CGFloat = 0
    @State private var currentImageIndex: Int = 0
    
    let model: CardModel
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ZStack(alignment: .top) {
                Image(user.profileImageUrls[currentImageIndex])
                    .resizable()
                    .scaledToFill()
                    .overlay(
                        ImageScrollingOverlay(
                            currentImageIndex: $currentImageIndex,
                            imageCount: imageCount)
                    )
                
                CardImageIndicatorView(currentImageIndex: $currentImageIndex, imageCount: imageCount)
                
                SwipeActionIndicatorView(xOffset: $xOffset)
            }
            InfoView(user: user)
        }
        .onReceive(
            viewModel.$buttonSwipeAction,
            perform: {action in
                onReceiveSwipeAction(action)
            }
        )
        .frame(width: SizeConstants.cardWidth, height: SizeConstants.cardHeight)
        .scaledToFill()
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .offset(x: xOffset)
        .rotationEffect(.degrees(degrees))
        .animation(.snappy, value: xOffset)
        .gesture(
            DragGesture()
                .onChanged(onDragChanged)
                .onEnded(onDragEnded)
        )
    }
}

private extension CardView {
    var user: User {
        return model.user
    }
    
    var imageCount: Int {
        return model.user.profileImageUrls.count
    }
}

private extension CardView {
    func returnToCenter() {
        xOffset = 0
        degrees = 0
    }
    func swipeRight() {
        withAnimation{
            xOffset = 500
            degrees = 12
        } completion: {
            viewModel.removeCard(model)
        }
    }
    func swipeLeft() {
        withAnimation{
            xOffset = -500
            degrees = -12
        } completion: {
            viewModel.removeCard(model)
        }
    }
    
    func onReceiveSwipeAction(_ action: SwipeAction?) {
        guard let action else { return }
        
        let topCard = viewModel.cardModels.last
        
        if topCard == model {
            switch action {
            case .reject:
                swipeLeft()
            case .like:
                swipeRight()
            }
        }
    }
}

private extension CardView {
    func onDragChanged(_ value: _ChangedGesture<DragGesture>.Value) {
        xOffset = value.translation.width
        degrees = Double(value.translation.width / 25)
    }
    func onDragEnded(_ value: _ChangedGesture<DragGesture>.Value) {
        let width = value.translation.width
        
        if abs(width) < abs(SizeConstants.screenCutOff) {
            return returnToCenter()
        }
        if width >= SizeConstants.screenCutOff {
            swipeRight()
        } else {
            swipeLeft()
        }
    }
}

#Preview {
    CardView(viewModel: CardViewModel(service: CardService()),
             model: CardModel(user: MockData.users[0])
    )
}
