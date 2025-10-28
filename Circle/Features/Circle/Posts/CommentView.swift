//
//  CommentView.swift
//  Circle
//
//  Created by Mario Pandapotan Simarmata on 27/10/25.
//

import SwiftUI

struct CommentView: View {
    @State var isShowMenu: Bool = false
    var showComment: Bool = false
    @State private var comment: String = ""
    
    var body: some View {
        ScrollView {
            VStack {
                PostCardView(mode: .comment)
            }
        }
        .contentMargins(.vertical,16)
        .padding(.top, 2)
        .padding(.horizontal, 20)
        .background(LinearGradient(
            colors: [Color(.background2), Color(.background1)],
            startPoint: .top,
            endPoint: .bottom
        ))
        .navigationTitle("Post")
        .navigationBarTitleDisplayMode(.inline)
        .edgesIgnoringSafeArea([])
        .tint(.black)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                HStack{
                    Image(DesignImages.logoutIcon)
                }
            }
            
        }
    }
}

#Preview {
    CommentView()
}
