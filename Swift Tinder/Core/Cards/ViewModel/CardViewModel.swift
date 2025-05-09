//
//  CardViewModel.swift
//  Swift Tinder
//
//  Created by Duong Phuong on 9/5/25.
//

import Foundation

@MainActor
class CardViewModel: ObservableObject {
    @Published var cardModels = [CardModel]()
    @Published var buttonSwipeAction: SwipeAction?
    
    private let service: CardService
    
    init(service: CardService) {
        self.service = service
        Task { await fetchCardModels() }
    }
    
    func fetchCardModels() async {
        do {
            self.cardModels = try await service.fetchCardModels()
        } catch {
            print("Failed to fetch card models \(error)")
        }
    }
    
    func removeCard(_ card: CardModel) {
        guard let index = cardModels.firstIndex(where: { $0.id == card.id }) else { return }
        print("Remove card index = \(index)")
        cardModels.remove(at: index)
    }
    
    func pressReject() {
        buttonSwipeAction = SwipeAction.reject
    }
    
    func pressLike() {
        buttonSwipeAction = SwipeAction.like
    }
}
