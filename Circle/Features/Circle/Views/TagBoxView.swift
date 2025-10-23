//
//  TagBoxView.swift
//  Circle
//
//  Created by Mario Pandapotan Simarmata on 23/10/25.
//

import SwiftUI

struct TagBoxView: View {
    var text: String
    var color: Color
    var body: some View {
        VStack {
            Text(text)
                .font(.custom(DesignFonts.InterLight, size: 10))
                .padding(.horizontal, 5)
                .padding(.vertical, 2)
                .background(color)
                .overlay(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(Color(DesignColors.borderT2), lineWidth: 1)
                )
                .clipShape(RoundedRectangle(cornerRadius: 4))
        }
    }
}
