//
//  ExpandableTextView.swift
//  Circle
//
//  Created by Mario Pandapotan Simarmata on 23/10/25.
//

import SwiftUI

struct ExpandableTextInline: View {
    let fullText: String
    @State private var expanded = false
    
    var truncatedMessage: AttributedString {
        let limit = 80
        if fullText.count <= limit {
            return AttributedString(fullText)
        }
        
        let index = fullText.index(fullText.startIndex, offsetBy: limit)
        let baseString = String(fullText[..<index]) + "... more"
        
        var s = AttributedString(baseString)
        
        s.foregroundColor = Color(DesignColors.hostedBy)
        s.font = .custom(DesignFonts.InterLight, size: 12)
        
        if let range = s.range(of: "more") {
            s[range].foregroundColor = Color(DesignColors.hostedBy)
            s[range].font = .custom(DesignFonts.InterBold, size: 12)
            s[range].link = URL(string: "app://expand")
        }
        
        return s
    }
    
    var body: some View {
        Group {
            if expanded {
                Text(fullText)
                    .font(.custom(DesignFonts.InterLight, size: 12))
                    .foregroundColor(Color(DesignColors.hostedBy))
            } else {
                Text(truncatedMessage)
                    .multilineTextAlignment(.leading)
                    .environment(\.openURL, OpenURLAction { url in
                        if url.scheme == "app", url.host == "expand" {
                            withAnimation(.easeInOut) {
                                expanded = true
                            }
                            return .handled
                        }
                        return .systemAction
                    })
            }
        }
    }
}

#Preview {
    ExpandableTextInline(
        fullText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse potenti. Proin dictum pretium nibh, id varius risus viverra sit amet. Nulla facilisi."
    )
}


struct ExpandableTextInline_Previews: PreviewProvider {
    static var previews: some View {
        ExpandableTextInline(fullText: "This 30-minute mindfulness practice is designed to help you slow down, reset, and reconnect with yourself. Together We Can do amazing things!")
    }
}
