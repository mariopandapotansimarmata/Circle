//
//  Replies.swift
//  Circle
//
//  Created by Mario Pandapotan Simarmata on 30/10/25.
//

import Foundation

struct Replies: Identifiable {
    var id: UUID = UUID()
    
    var name: String
    var createdAt: String
    var likes: Int
}
