//
//  OverviewView.swift
//  Circle
//
//  Created by Mario Pandapotan Simarmata on 23/10/25.
//

import SwiftUI

struct OverviewView: View {
    var body: some View {
        ScrollView{
            VStack {
                HStack (spacing: 10){
                    ProfileImageView()
                    
                    VStack(alignment: .leading, spacing: 0){
                        Text("Hosted by:")
                            .font(.custom(DesignFonts.InterLight, size: 12))
                            .foregroundStyle(Color(DesignColors.hostedBy))
                        HStack (spacing: 10){
                            Text("Jane Doe")
                                .font(.custom(DesignFonts.InterMedium, size: 14))
                            VStack {
                                Text("T2")
                                    .font(.custom(DesignFonts.InterLight, size: 10))
                                    .padding(.horizontal, 5)
                                    .padding(.vertical, 2)
                                    .background(Color(DesignColors.followImageBorder))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 4)
                                            .stroke(Color(DesignColors.borderT2), lineWidth: 1)
                                    )
                                    .clipShape(RoundedRectangle(cornerRadius: 4))
                            }
                        }
                    }.frame(maxWidth: .infinity, alignment: .leading)
                    
                    Spacer()
                    
                    Button { }label: {
                        Image(systemName: "ellipsis")
                    }.foregroundStyle(Color(DesignColors.ellipsisColor))
                    
                }.padding(.horizontal, 20)
            }
        }
    }
}

#Preview {
    ContentView()
}

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
