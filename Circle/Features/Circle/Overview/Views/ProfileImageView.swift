//
//  ProfileImageView.swift
//  Circle
//
//  Created by Mario Pandapotan Simarmata on 23/10/25.
//

import SwiftUI

struct ProfileImageView: View {
    var body: some View {
        ZStack (alignment: .bottom){
            ZStack (alignment: .bottom){
                Image(DesignImages.personImage)
            }
            .frame(width: 50, height: 50)
            .overlay(
                Circle()
                    .stroke(Color(DesignColors.followImageBorder), lineWidth: 4)
            )
            .clipShape(Circle())
            
            VStack{
                Text("Follow")
                    .font(.custom(DesignFonts.InterSemiBold, size: 7))
            }
            .padding(.horizontal,6)
            .padding(.vertical,2)
            .background(Color(.white))
            .overlay(
                Capsule()
                    .stroke(Color(DesignColors.followBorder), lineWidth: 1)
            )
            .clipShape(.capsule)
            .offset(y:5)
        }
    }
}
