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
        ZStack() {
            ForEach(viewModel.cardModels) {card in
                CardView(cardViewModel: CardViewModel(service: CardService()),model: card)
            }
        }
        .onChange(of: viewModel.cardModels, {olValue, newValue in
            print("DEBUG: new value of card models \(newValue)")
        })
    }
}

#Preview {
    CardStackView()
}
