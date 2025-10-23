//
//  TabServiceView.swift
//  Circle
//
//  Created by Mario Pandapotan Simarmata on 23/10/25.
//

import SwiftUI

struct TabServiceView: View {
    var text: String
    var isSelected: Bool
    var body: some View {
        VStack {
            Text(text)
                .font(.custom(isSelected ? DesignFonts.InterRegular: DesignFonts.InterLight, size: 12))
                .foregroundStyle(isSelected ? Color.black : Color.tabDeactive)
            
            RoundedRectangle(cornerRadius: .infinity)
                .frame(height: 1)
                .foregroundStyle(isSelected ? Color(DesignColors.tabIndicator) : .clear)
        }
        .fixedSize()
    }
}

#Preview {
    CircleView()
}
