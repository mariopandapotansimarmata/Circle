//
//  RulesCardView.swift
//  Circle
//
//  Created by Mario Pandapotan Simarmata on 23/10/25.
//

import SwiftUI

struct RulesCardView: View {
    let rules: [String] = [
        "Respect all members’ privacy and personal experiences.",
        "Be kind, supportive, and non-judgmental.",
        "No unsolicited promotions or outside links.",
        "The provider has the authority to turn off posting, comments, and reactions as they see fit",
        "User’s not following the guidelines or terms of conditions will be removed from the circle"
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            Text("Rules")
                .font(.system(size: 12,weight: .medium))
                .padding(.bottom, 8)
            
            ForEach(rules, id: \.self){ rule in
                HStack(alignment: .top, spacing: 8) {
                    Text("•")
                        .font(.custom(DesignFonts.InterLight, size: 12))
                    Text(rule)
                        .font(.custom(DesignFonts.InterLight, size: 12))
                }.frame(maxWidth: .infinity, alignment: .leading)
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
