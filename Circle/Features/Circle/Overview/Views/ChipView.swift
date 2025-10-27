//
//  ChipView.swift
//  Circle
//
//  Created by Mario Pandapotan Simarmata on 23/10/25.
//

import SwiftUI

struct ChipView: View {
    var text: String
    var status: Bool = false
    
    var body: some View {
        HStack{
            Text(text)
                .font(.custom(DesignFonts.InterLight, size: 11))
            Text(status ? "On" : "Off")
                .font(.custom(DesignFonts.InterBold, size: 11))
        }
        .padding(.vertical, 5)
        .padding(.horizontal, 9)
        .background(Color(.greenChip))
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color(DesignColors.borderT2), lineWidth: 1)
        )
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}
