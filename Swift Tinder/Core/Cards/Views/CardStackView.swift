//
//  CardStackView.swift
//  Swift Tinder
//
//  Created by Duong Phuong on 9/5/25.
//

import SwiftUI

struct CardStackView: View {
    @StateObject var viewModel = CardViewModel(service: CardService())
    
    var body: some View {
        VStack(spacing: 16) {
            ZStack() {
                ForEach(viewModel.cardModels) {card in
                    CardView(viewModel: viewModel, model: card)
                }
            }
            ActionButtonView(viewModel: viewModel)
        }
    }
}

#Preview {
    CardStackView()
}
