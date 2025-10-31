//
//  PostCardView.swift
//  Circle
//
//  Created by Mario Pandapotan Simarmata on 23/10/25.
//

import SwiftUI

enum PostCardMode {
    case overview
    case post
    case comment
    case editing
}

struct PostCardView: View {
    @Environment(\.dismiss) var dismiss
    @State private var isShowMenu: Bool = false
    @State private var comment: String = ""
    @Binding var post: Post
    @Binding var listPost: [Post]
    @Binding var focusPost: Int
    var index: Int = -1
    
    @Binding var mode: PostCardMode
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            VStack(alignment: .trailing) {
                if mode == .editing {
                    Button {
                        withAnimation {
                            focusPost = -1
                            mode = .post
                        }
                    } label:{
                        Image(DesignImages.x)
                            .padding(.horizontal, 24)
                            .padding(.bottom, 8)
                    }
                }
                VStack(alignment: .leading, spacing: 15) {
                    HStack {
                        HStack{
                            ZStack (alignment: .bottom) {
                                ZStack (alignment: .bottom) {
                                }
                                .frame(width: 31, height: 31)
                                .background(Color(.systemGray5))
                                .overlay(
                                    Circle()
                                        .stroke(Color(DesignColors.tabIndicator), lineWidth: 2)
                                )
                                .clipShape(Circle())
                            }
                            
                            VStack (alignment: .leading){
                                HStack{
                                    Text(post.name)
                                        .font(.custom(DesignFonts.InterRegular, size: 12))
                                    if mode != .editing{
                                        TagBoxView(text: "Host", color: Color(DesignColors.host))
                                        TagBoxView(text: "Pinned", color: Color(DesignColors.pinned))
                                    }
                                }
                                Text(post.createdAt)
                                    .font(.custom(DesignFonts.InterLight, size: 11))
                                    .foregroundStyle(Color(DesignColors.hostedBy))
                            }
                        }
                        
                        Spacer()
                        
                        Image(systemName: "ellipsis")
                            .onTapGesture {
                                withAnimation {
                                    isShowMenu.toggle()
                                }
                            }
                    }
                    
                    if mode != .editing {
                        VStack(alignment: .leading ,spacing: 2) {
                            if post.isEdited {
                                Text("Edited")
                                    .font(.caption2).fontWeight(.light)
                                    .foregroundStyle(Color(DesignColors.tabIndicator))
                            }
                            Text(post.note)
                                .font(.system(size: 11).weight(.light))
                                .lineSpacing(8)
                        }
                    }
                    
                    
                    if !post.photos.isEmpty {
                        FluidImages(photos: $post.photos)
                    }
                    
                    if mode == .post || mode == .editing {
                        VStack (alignment: .leading ,spacing: 2){
                            if mode == .editing {
                                Text("Editing...")
                                    .font(.caption2).fontWeight(.light)
                                    .foregroundStyle(Color(DesignColors.tabIndicator))
                            }
                               
                               
                            
                            
                            VStack (alignment: .trailing){
                                ZStack(alignment: .leading) {
                                    TextEditor(text: $comment)
                                        .font(.custom(DesignFonts.InterLight, size: 12))
                                        .background(.clear)
                                        .padding(.vertical, -8)

                                    if comment.isEmpty {
                                        Text("Add Something...")
                                            .lineSpacing(0)
                                            .foregroundColor(.gray)
                                            .font(.custom(DesignFonts.InterLight, size: 12))
                                            .offset(x: 4)
                                    }
                                }
                                .onChange(of: mode) { newMode in
                                    if newMode != .editing {
                                        comment = ""
                                    }
                                }
                                if mode == .editing {
                                    Button {
                                        post.note = comment
                                        post.isEdited = true
                                        focusPost = -1
                                        mode = .post
                                    } label:{
                                        Text("Save")
                                            .font(.custom(DesignFonts.InterLight, size: 11))
                                            .padding(.horizontal, 24)
                                            .padding(.vertical, 3)
                                            .overlay {
                                                RoundedRectangle(cornerRadius: 5)
                                                    .stroke(Color(.black), lineWidth: 1)
                                            }
                                            .background(Color(DesignColors.host))
                                    }
                                }
                            }
                            .padding(12)
                            .fixedSize(horizontal: false, vertical: mode == .editing ? false : true)
                            .frame(minHeight: 45)
                            .overlay {
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color(DesignColors.cardBorder), lineWidth: 0.3)
                            }
                        }
                    }
                    
                    HStack {
                        PostChipLike(isLike: true, number: $post.likes)
                        PostChipComment(image: mode == .comment ? DesignImages.chatIconFill : DesignImages.chatIcon, text: String($post.replies.count), canNavigate: mode == .post ? true : false, isLocked: $post.isLockedComment,post: $post, listPosts: $listPost)
                    }
                    
                    if mode == .comment {
                        TextField("", text: $comment,
                                  prompt: Text("Type your comment here...")
                            .foregroundStyle(.gray)
                            .font(.custom(DesignFonts.InterLight, size: 12))
                        )
                        .font(.system(size: 14))
                        .padding(.horizontal, 15)
                        .frame(maxWidth: .infinity)
                        .frame(height: 45)
                        .background(Color.white)
                        .overlay {
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color(DesignColors.cardBorder), lineWidth: 1)
                        }
                        .cornerRadius(15)
                        .padding(.bottom, 20)
                        
                        Divider()
                        
                        VStack {
                            VStack(alignment: .leading, spacing: 14) {
                                ForEach($post.replies) { reply in
                                    ReplyCommentView(reply: reply)
                                    Divider()
                                }
                                
                                Divider()
                                HStack {
                                    HStack {
                                        Text("Load more")
                                            .font(.caption)
                                        Image(systemName:"chevron.down")
                                            .font(.caption)
                                    }
                                    Spacer()
                                    HStack {
                                        Text("Hide replies ")
                                            .font(.caption)
                                        Image(systemName:"chevron.up")
                                            .font(.caption)
                                    }
                                }
                            }
                        }
                    }
                }
                .padding(20)
                .frame(maxWidth: .infinity)
                .background(.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color(DesignColors.cardBorder), lineWidth: 1)
                )
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .onTapGesture {
                    isShowMenu = false
                }
            }
            
            if isShowMenu {
                ZStack {
                    VStack(spacing: 10) {
                        if post.name == "Mario"{
                            Button {
                                withAnimation (.spring){
                                    focusPost = index
                                    isShowMenu = false
                                    mode = .editing
                                    comment = post.note
                                }
                                
                            } label: {
                                Text("Edit post")
                                    .frame(maxWidth: .infinity)
                                    .font(.custom(DesignFonts.InterRegular,size: 11))
                                    .padding(.vertical, 3)
                                    .padding(.horizontal, 7)
                                    .background(Color(DesignColors.host))
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 5)
                                            .stroke(Color(.black), lineWidth: 1)
                                    }
                                    .clipShape(RoundedRectangle(cornerRadius: 5))
                                
                            }
                            Divider()
                        }
                        
                        Text("Report post")
                            .frame(maxWidth: .infinity)
                            .font(.custom(DesignFonts.InterRegular,size: 11))
                            .padding(.vertical, 3)
                            .padding(.horizontal, 7)
                            .background(.black)
                            .foregroundStyle(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                        
                        Divider()
                        
                        if post.name == "Mario" {
                            Button {
                                listPost.removeAll(where: { $0.id == post.id })
                                dismiss()
                            } label:{
                                Text("Delete post")
                                    .frame(maxWidth: .infinity)
                                    .font(.custom(DesignFonts.InterRegular,size: 11))
                                    .padding(.vertical, 3)
                                    .padding(.horizontal, 7)
                                    .background(Color(.systemRed))
                                    .foregroundStyle(.white)
                                    .clipShape(RoundedRectangle(cornerRadius: 5))
                                
                            }
                        }
                    }
                    .fixedSize()
                    .padding(20)
                    .background(Color.white)
                    .overlay {
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color(DesignColors.cardBorder), lineWidth: 1)
                    }
                    .cornerRadius(15)
                }
                .shadow(color: Color.black.opacity(0.15), radius: 8, x: 0, y: 4)
                .offset(x: -20, y: 45)
            }
            
        }
    }
}

#Preview {
    //    PostCardView()
    CircleView()
}
