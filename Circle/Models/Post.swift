//
//  PostModel.swift
//  Circle
//
//  Created by Mario Pandapotan Simarmata on 30/10/25.
//

import SwiftUI

@Observable
class Post: Identifiable {
    var id: UUID = UUID()
    var name: String
    var createdAt: String
    var photos: [String]
    var replies: [Replies]
    var likes: Int
    var isEdited: Bool
    var isLockedComment: Bool
    var note: String
    
    init(name: String, createdAt: String, photos: [String], replies: [Replies], likes: Int, isEdited: Bool, isLockedComment: Bool, note: String) {
        self.name = name
        self.createdAt = createdAt
        self.photos = photos
        self.replies = replies
        self.likes = likes
        self.isEdited = isEdited
        self.isLockedComment = isLockedComment
        self.note = note
    }
}
