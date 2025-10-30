//
//  ReplyCommentView.swift
//  Circle
//
//  Created by Mario Pandapotan Simarmata on 31/10/25.
//

import SwiftUI

struct ReplyCommentView: View {
    @State private var isShowMenu: Bool = false
    @Binding var reply: Replies
    var body: some View {
        ZStack(alignment: .topTrailing) {
            VStack(alignment: .leading, spacing: 14) {
                HStack {
                    HStack{
                        ZStack (alignment: .bottom) {
                            ZStack (alignment: .bottom) {
                            }
                            .frame(width: 28, height: 28)
                            .background(Color(.systemGray5))
                            .overlay(
                                Circle()
                                    .stroke(Color(DesignColors.tabIndicator), lineWidth: 2)
                            )
                            .clipShape(Circle())
                        }
                        
                        VStack (alignment: .leading){
                            HStack{
                                Text("Sarah Pearson")
                                    .font(.custom(DesignFonts.InterRegular, size: 12))
                              
                            }
                            Text("2y")
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
                
                Text("Maecenas pulvinar ante ex, ut tristique odio varius solliciwtudin. Praesent id ornare ante. Nam lobortis tempus Praesent id ornare ante. Nam lobortis tempus luctus. ")
                    .font(.system(size: 11).weight(.light))
                    .lineSpacing(8)
                
                PostChipView(image: DesignImages.loveIcon, text: "15",post: .constant(Post(name: "", createdAt: "", photos: [], replies: [], likes: 0, isEdited: false, isLockedComment: false, note: "")))
            }
            .padding(.leading, 30)
            .onTapGesture {
                isShowMenu = false
            }
            
            if isShowMenu {
                ZStack {
                    VStack(spacing: 10) {
                        Text("Report post")
                            .frame(maxWidth: .infinity)
                            .font(.custom(DesignFonts.InterRegular,size: 11))
                            .padding(.vertical, 3)
                            .padding(.horizontal, 7)
                            .background(.black)
                            .foregroundStyle(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                        
                        Divider()
                        
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
                .offset(x: 0, y: 25)
            }
        }
    }
}
