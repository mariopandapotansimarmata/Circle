//
//  Host.swift
//  Circle
//
//  Created by Mario Pandapotan Simarmata on 30/10/25.
//

class Host {
    var name: String
    var title: String
    var description: String
    var posts: [Post]
    
    init(name: String, title: String, description: String, posts: [Post]) {
        self.name = name
        self.title = title
        self.description = description
        self.posts = posts
    }
}
