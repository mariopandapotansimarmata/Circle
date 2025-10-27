//
//  PostsView.swift
//  Circle
//
//  Created by Mario Pandapotan Simarmata on 27/10/25.
//

import SwiftUI

struct PostView: View {
    //    @State var isFocus: Bool = false
    @State private var comment: String = ""
    @FocusState private var commentFieldIsFocused: Bool
    
    var body: some View {
        ScrollView (showsIndicators: true){
            ZStack (alignment: .top) {
                VStack(spacing: 20) {
                    PostFormView()
                    PostCardView(showComment: true)
                    PostCardView(showComment: true)
                }
                .padding(.horizontal,20)
                .blur(radius: commentFieldIsFocused ? 12 : 0)
                .allowsHitTesting(false)

                if commentFieldIsFocused {
                    Color.black.opacity(0.001)
                        .ignoresSafeArea()
                        .onTapGesture {
                            withAnimation {
                                commentFieldIsFocused = false
                            }
                        }
                }
                
                VStack(spacing: 36) {
                    TextField(
                        "",
                        text: $comment,
                        prompt: Text("Add Something...")
                    )
                    .focused($commentFieldIsFocused)
                    .foregroundStyle(.gray)
                    .font(.custom(DesignFonts.InterLight, size: 11))
                    
                    HStack {
                        ChipButton(title: "Camera")
                        ChipButton(title: "Photos")
                        ChipButton(title: "Files")
                        Spacer()
                        ChipButton(title: "Post",color: DesignColors.host)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .font(.system(size: 14))
                .padding(.horizontal, 20)
                .padding(.vertical,20)
                .frame(maxWidth: .infinity)
                .background(Color.white)
                .overlay {
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color(DesignColors.cardBorder), lineWidth: 1)
                }
                .cornerRadius(15)
                .padding(.horizontal, 20)
                
            }
        }
        .contentMargins(.vertical,20)
    }
}

#Preview {
    CircleView()
}

