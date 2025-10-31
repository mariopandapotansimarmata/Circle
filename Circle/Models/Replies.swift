//
//  Replies.swift
//  Circle
//
//  Created by Mario Pandapotan Simarmata on 30/10/25.
//

import Foundation

class Replies: Identifiable {
    var id: UUID = UUID()
    var name: String
    var createdAt: String
    var likes: Int
    
    init( name: String, createdAt: String, likes: Int) {
        self.name = name
        self.createdAt = createdAt
        self.likes = likes
    }
}
