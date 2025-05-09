//
//  CardService.swift
//  Swift Tinder
//
//  Created by Duong Phuong on 9/5/25.
//

import Foundation

struct CardService {
    func fetchCardModels() async throws -> [CardModel] {
        let users = MockData.users
        return users.map( { CardModel(user: $0) } )
    }
}
