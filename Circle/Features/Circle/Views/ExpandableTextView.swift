//
//  ExpandableTextView.swift
//  Circle
//
//  Created by Mario Pandapotan Simarmata on 23/10/25.
//

import SwiftUI
import SwiftUI
struct ExpandableTextInline: View {
    let fullText: String
    @State private var expanded = false
    
    var body: some View {
        VStack(alignment: .leading) {
            if expanded {
                Text(fullText)
                    .font(.custom(DesignFonts.InterLight, size: 12))
            } else {
                Text(truncatedText(fullText))
                    .font(.custom(DesignFonts.InterLight, size: 12))
                    + Text(" more")
                        .font(.custom(DesignFonts.InterBold, size: 12))
                        .foregroundColor(Color(DesignColors.ellipsisColor))
                        
            }
        }
        .onTapGesture {
            expanded = true }
        .animation(.easeInOut, value: expanded)
    }
    
    func truncatedText(_ text: String) -> String {
        let limit = 80
        if text.count > limit {
            let index = text.index(text.startIndex, offsetBy: limit)
            return String(text[..<index]) + "..."
        }
        return text
    }
}


struct ExpandableTextInline_Previews: PreviewProvider {
    static var previews: some View {
        ExpandableTextInline(fullText: "This 30-minute mindfulness practice is designed to help you slow down, reset, and reconnect with yourself. Together We Can do amazing things!")
    }
}
