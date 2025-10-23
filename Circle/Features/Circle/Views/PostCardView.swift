//
//  PostCardView.swift
//  Circle
//
//  Created by Mario Pandapotan Simarmata on 23/10/25.
//

import SwiftUI

struct PostCardView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 15){
            HStack {
                HStack{
                    ZStack (alignment: .bottom){
                        ZStack (alignment: .bottom){
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
            }
            
            Text("Maecenas pulvinar ante ex, ut tristique odio varius sollicitudin. Praesent id ornare ante. Nam lobortis tempus luctus. Vivamus nunc turpis, efficitur eu tincidunt id, sodales sodales dui. Ut sollicitudin nibh id mi mollis, venenatis congue eros interdum. Maecenas ex erat, tincidunt malesuada nisl at, tincidunt sagittis ex. Duis egestas ac massa eu pharetr...more")
                .font(.system(size: 11).weight(.light))
                .lineHeight(.loose)
            
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
    }
}

#Preview {
    PostCardView()
}
