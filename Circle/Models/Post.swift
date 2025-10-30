//
//  PostModel.swift
//  Circle
//
//  Created by Mario Pandapotan Simarmata on 30/10/25.
//

import SwiftUI

struct Post: Identifiable {
    var id: UUID = UUID()
    var name: String
    var createdAt: String
    var photos: [String]
    var replies: [Replies]
    var likes: Int
    var isEdited: Bool
    var isLockedComment: Bool
    var note: String
}
