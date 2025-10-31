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

    var body: some View {
        ScrollView (showsIndicators: true) {
            ZStack (alignment: .top) {
                VStack(spacing: 20) {
                    PostFormView(photos: $photos,comment: $comment,listPosts: $listPosts, focusField: $focusField)

                    ForEach(listPosts.indices, id: \.self) { index in
                        PostCardView(post: $listPosts[index], listPost: $listPosts,mode:  .post)
                    }
                }
                .padding(.horizontal,20)
                .blur(radius: focusField ? 12 : 0)
                
                if focusField {
                    Color.black.opacity(0.001)
                        .ignoresSafeArea()
                        .onTapGesture {
                            withAnimation {
                                focusField = false
                            }
                        }
                }
                
                PostFormView(photos: $photos,comment: $comment,listPosts: $listPosts, focusField: $focusField)
                    .padding(.horizontal,20)
            }
        }
        .contentMargins(.vertical,20)
    }
}

#Preview {
    CircleView()
}

