//
//  OverviewView.swift
//  Circle
//
//  Created by Mario Pandapotan Simarmata on 23/10/25.
//

import SwiftUI

struct OverviewView: View {
    
    let cardItems: [CardData] = [
        CardData(text1: "Access", text2: "65 Days Left", text3: "3 months from purchase Ends Oct 31st, 2025"),
        CardData(text1: "Access", text2: "10 members", text3: nil),
        CardData(text1: "Access", text2: "Private", text3: "Req. to join"),
        CardData(text1: "Language", text2: "English", text3: "En"),
        CardData(text1: "Time zone", text2: "Europe", text3: "Local time")
    ]
    
    var body: some View {
        ScrollView{
            VStack (alignment: .leading , spacing: 16){
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
                    
                    Button {
                        
                    }label: {
                        Image(systemName: "ellipsis")
                    }.foregroundStyle(Color(DesignColors.ellipsisColor))
                }.padding(.horizontal, 20)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("30-Day Mindfulness Challenge")
                        .font(.custom(DesignFonts.InterMedium, size: 18))
                    
                    ExpandableTextInline(fullText: "This 30-minute mindfulness practice is designed to help you slow down, reset, and reconnect with yourself. Together We Can do amazing things!")
                }
                .padding(.horizontal,20)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(cardItems) { item in
                            CardHeader(text1: item.text1, text2: item.text2, text3: item.text3)
                        }
                        Spacer().frame(width: 20)
                    }
                    .padding(.leading, 20)
                }
            }
        }
    }
}

#Preview {
    CircleView()
}
