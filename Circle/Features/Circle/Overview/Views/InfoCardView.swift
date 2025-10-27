//
//  InfoCardView.swift
//  Circle
//
//  Created by Mario Pandapotan Simarmata on 23/10/25.
//

import SwiftUI

struct InfoCardView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 15){
            Image(DesignImages.infoIcon)
            Text("Ongoing Circles: ")
                .font(.custom(DesignFonts.InterMedium, size: 12))
            +
            Text("allow users to start a program anytime, they are continuous and members have access for a set amount of time. Please make sure to look at the time period you have access too before joining the circle. Your time starts the day you join.You may buy as many months access as you would like. Host’s can mute and delete posts and users as they see fit. ")
                .font(.custom(DesignFonts.InterLight, size: 12))
                .foregroundStyle(Color(DesignColors.hostedBy))
        }
        .padding(20)
        .frame(maxWidth: .infinity,alignment: .leading)
        .background(.white)
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color(DesignColors.cardBorder), lineWidth: 1)
        )
        .clipShape(RoundedRectangle(cornerRadius: 15))
    
    }
}
