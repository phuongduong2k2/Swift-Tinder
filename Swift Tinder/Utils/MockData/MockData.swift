//
//  MockData.swift
//  Swift Tinder
//
//  Created by Duong Phuong on 9/5/25.
//

import Foundation

struct MockData {
    
    static let users: [User] = [
        .init(id: NSUUID().uuidString, fullName: "UlsanBool", age: 20, profileImageUrls: ["user1", "user2","user4","user5","user3"], location: "VietNam"),
        .init(id: NSUUID().uuidString, fullName: "Peter", age: 29, profileImageUrls: ["user3", "user4","user1", "user2",], location: "USA"),
        .init(id: NSUUID().uuidString, fullName: "David", age: 34, profileImageUrls: ["user5", "user2", "user4"], location: "Japan")
    ]
}
