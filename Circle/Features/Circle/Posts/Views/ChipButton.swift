//
//  ChipButton.swift
//  Circle
//
//  Created by Mario Pandapotan Simarmata on 27/10/25.
//

import SwiftUI

struct ChipButton: View {
     var title: String
     var color: String?
    
    var body: some View {
        Button {
            // add logic
        } label: {
            Text(title)
                .foregroundStyle(.black.opacity(0.6))
                .font(.custom(DesignFonts.InterLight, size: 11))
                .padding(.vertical, 7)
                .padding(.horizontal, 10)
                .background(Color(color ?? DesignColors.whiteColor))
                .overlay {
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color(DesignColors.cardBorder), lineWidth: 1)
                }
                .cornerRadius(15)
        }
    }
}

#Preview {
    CircleView()
}
