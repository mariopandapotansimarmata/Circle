//
//  CardHeader.swift
//  Circle
//
//  Created by Mario Pandapotan Simarmata on 23/10/25.
//

import SwiftUI

struct CardHeader: View {
    var text1: String
    var text2: String
    var text3: String? = nil
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            Text(text1)
                .font(.custom(DesignFonts.InterLight, size: 11))
            Text(text2)
                .font(.custom(DesignFonts.InterMedium, size: 12))
                .frame(maxWidth: 126, alignment: .leading)
                .fixedSize(horizontal: true, vertical: true)
            
            if let text3 {
                Text(text3)
                    .lineLimit(2)
                    .font(.custom(DesignFonts.InterLight, size: 11))
                    .frame(maxWidth: 126, alignment: .leading)
                    .fixedSize(horizontal: true, vertical: true)
            }
        }
        .padding(EdgeInsets(top: 0, leading: 20, bottom: 6, trailing: 20))
        .frame(height: 96)
        .background(.white)
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color(DesignColors.cardBorder), lineWidth: 1)
        )
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}
