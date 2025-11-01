//
//  PostFormView.swift
//  Circle
//
//  Created by Mario Pandapotan Simarmata on 27/10/25.
//

import SwiftUI

struct PostFormView: View {
    @Binding var photos: [String]
    @Binding var comment: String
    @Binding var listPosts: [Post]
    @FocusState.Binding var focusField: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ZStack(alignment: .leading) {
                
                TextEditor(text: $comment)
                    .focused($focusField)
                    .font(.custom(DesignFonts.InterLight, size: 11))
                    .background(.clear)
                    .padding(.vertical, -8)

                // Placeholder
                if comment.isEmpty {
                    Text("Add Something...")
                        .lineSpacing(0)
                        .foregroundColor(.gray)
                        .font(.custom(DesignFonts.InterLight, size: 11))
                        .onTapGesture {
                            focusField = true
                        }
                        .offset(x: 4)
                }
            }
            .fixedSize(horizontal: false, vertical: true)
            
            if !photos.isEmpty {
                FluidImages(photos: $photos, deletable: true)
            }
            
            HStack() {
                ChipButton(title: "Camera")
                ChipButton(title: "Photos", color: !photos.isEmpty ? DesignColors.photoChipBack : DesignColors.whiteColor)
                    .onTapGesture {
                        let image = "image1"
                        if photos.count < 5 {
                            photos.append(image)
                        }
                    }
                
                ChipButton(title: "Files")
                Spacer()
                ChipButton(title: "Post",color: DesignColors.host)
                    .onTapGesture {
                        let newPost = Post(name: "Mario", createdAt: "today", photos: photos, replies: [], likes: 0, isEdited: false, isLockedComment: false, note: comment)

                        listPosts.append(newPost)
                        
                        photos = []
                        comment = ""
                        focusField = false
                    }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .font(.system(size: 14))
        .padding(.horizontal, 20)
        .padding(.top, 16)
        .padding(.bottom, 20)
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .overlay {
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color(DesignColors.cardBorder), lineWidth: 1)
        }
        .cornerRadius(15)
        
    }
}

#Preview {
    CircleView()
}
