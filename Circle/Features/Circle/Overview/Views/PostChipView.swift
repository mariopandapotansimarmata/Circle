//
//  PostChipView.swift
//  Circle
//
//  Created by Mario Pandapotan Simarmata on 23/10/25.
//

import SwiftUI

struct PostChipView: View {
    var image: String
    var text: String
    
    var body: some View {
        HStack {
            Image(image)
            Text(text)
                .font(.custom(DesignFonts.InterRegular, size: 12))
        }
        .padding(.horizontal, 7)
        .padding(.vertical, 5)
        .overlay(
            RoundedRectangle(cornerRadius: 7)
                .stroke(Color(DesignColors.borderT2), lineWidth: 1)
        )
        .clipShape(RoundedRectangle(cornerRadius: 7))
    }
}
