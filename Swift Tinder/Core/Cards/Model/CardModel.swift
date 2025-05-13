//
//  CardModel.swift
//  Swift Tinder
//
//  Created by Duong Phuong on 9/5/25.
//

import Foundation

struct CardModel {
    let user: User
}

extension CardModel: Identifiable, Hashable {
    var id: String { return user.id }
}
