//
//  PostsView.swift
//  Circle
//
//  Created by Mario Pandapotan Simarmata on 27/10/25.
//

import SwiftUI

struct PostView: View {
    @State private var comment: String = ""
    @FocusState private var focusField: Bool
    @Binding var listPosts: [Post]
    @State var photos: [String] = []
    @State var focusPost: Int = -1
    @State var mode: PostCardMode = .post
    
    var body: some View {
        ScrollView (showsIndicators: true) {
            ZStack (alignment: .top) {
                VStack(spacing: 20) {
                    PostFormView(photos: $photos,comment: $comment, listPosts: $listPosts, focusField: $focusField)
                        .blur(radius: focusPost != -1 ? 12 : 0)
                    
                    ForEach($listPosts.indices, id: \.self) { index in
                        PostCardView(post: $listPosts[index],
                                     listPost: $listPosts,
                                     focusPost: $focusPost,
                                     index: index,
                                     mode: $mode
                        )
                        
                        .blur(radius: focusPost != -1 && focusPost != index || focusField ? 12 : 0)

                    }
                }
                .padding(.horizontal,20)
                
                if focusField  {
                    Color.black.opacity(0.001)
                        .ignoresSafeArea()
                        .onTapGesture {
                            withAnimation {
                                focusField = false
                                mode = .post
                            }
                        }
                }
            }
        }
        .contentMargins(.vertical,20)
    }
}

#Preview {
    CircleView()
}

