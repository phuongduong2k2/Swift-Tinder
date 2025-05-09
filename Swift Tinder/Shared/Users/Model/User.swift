//
//  User.swift
//  Swift Tinder
//
//  Created by Duong Phuong on 9/5/25.
//

import Foundation
struct User: Identifiable, Hashable {
    let id: String
    let fullName: String
    let age: Int
    let profileImageUrls: [String]
    let location: String
}
