//
//  PostCardView.swift
//  Circle
//
//  Created by Mario Pandapotan Simarmata on 23/10/25.
//

import SwiftUI

struct PostCardView: View {
    @State var isShowMenu: Bool = false
    var showComment: Bool = false
    @State private var comment: String = ""
    
    var body: some View {
        ZStack(alignment: .trailing) {
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
                                Text("Sarah Pearson")
                                    .font(.custom(DesignFonts.InterRegular, size: 12))
                                TagBoxView(text: "Host", color: Color(DesignColors.host))
                                TagBoxView(text: "Pinned", color: Color(DesignColors.pinned))
                            }
                            Text("3d")
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
                
                Text("Maecenas pulvinar ante ex, ut tristique odio varius sollicitudin. Praesent id ornare ante. Nam lobortis tempus luctus. Vivamus nunc turpis, efficitur eu tincidunt id, sodales sodales dui. Ut sollicitudin nibh id mi mollis, venenatis congue eros interdum. Maecenas ex erat, tincidunt malesuada nisl at, tincidunt sagittis ex. Duis egestas ac massa eu pharetr...more")
                    .font(.system(size: 11).weight(.light))
                    .lineSpacing(8)
                
                if showComment {
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
                }
                
                HStack {
                    PostChipView(image: DesignImages.loveIcon, text: "15")
                    PostChipView(image: DesignImages.chatIcon, text: "4")
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
            
            if isShowMenu {
                ZStack {
                    VStack(spacing: 10) {
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
                        
                        Divider()
                        
                        Text("Report post")
                            .frame(maxWidth: .infinity)
                            .font(.custom(DesignFonts.InterRegular,size: 11))
                            .padding(.vertical, 3)
                            .padding(.horizontal, 7)
                            .background(.black)
                            .foregroundStyle(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                        
                        Divider()
                        
                        Text("Delete post")
                            .frame(maxWidth: .infinity)
                            .font(.custom(DesignFonts.InterRegular,size: 11))
                            .padding(.vertical, 3)
                            .padding(.horizontal, 7)
                            .background(Color(.systemRed))
                            .foregroundStyle(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 5))
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
                .offset(x: -20, y: -8)
            }

        }
    }
}

#Preview {
    PostCardView()
}

