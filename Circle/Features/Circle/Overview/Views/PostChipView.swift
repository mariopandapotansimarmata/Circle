//
//  PostChipView.swift
//  Circle
//
//  Created by Mario Pandapotan Simarmata on 23/10/25.
//

import SwiftUI

struct PostChipComment: View {
    var image: String
    var text: String
    var canNavigate: Bool = false
    @Binding var isLocked: Bool
    @Binding var post: Post
    
    var body: some View {
        if canNavigate && !isLocked {
            NavigationLink(destination: CommentView(post: $post)) {
                chipContent
            }
            .buttonStyle(PlainButtonStyle())
        } else {
            chipContent
        }
    }
    
    private var chipContent: some View {
        HStack {
            Image(image)
                .tint(.red)
            if isLocked {
                Image(DesignImages.lock)
            } else {
                Text(text)
                    .font(.custom(DesignFonts.InterRegular, size: 12))
            }
        }
        .padding(.horizontal, 7)
        .padding(.vertical, 5)
        .background(isLocked ? Color(DesignColors.lock) : Color(.white) )
        .overlay(
            RoundedRectangle(cornerRadius: 7)
                .stroke(Color(DesignColors.borderT2), lineWidth: 1)
        )
        .clipShape(RoundedRectangle(cornerRadius: 7))
    }
}

struct PostChipLike: View {
    @State var isLike: Bool = false
    @Binding var number: Int
    var body: some View {
        HStack {
            Image(isLike ? DesignImages.loveIcon : DesignImages.loveIconFill)
            Text("\(isLike ? number + 1 : number)")
                .font(.custom(DesignFonts.InterRegular, size: 12))
        }
        .padding(.horizontal, 7)
        .padding(.vertical, 5)
        .overlay(
            RoundedRectangle(cornerRadius: 7)
                .stroke(Color(DesignColors.borderT2), lineWidth: 1)
        )
        .clipShape(RoundedRectangle(cornerRadius: 7))
        .onTapGesture {
            isLike.toggle()
        }
    }
}

#Preview {
    CircleView()
}
