//
//  PostFormView.swift
//  Circle
//
//  Created by Mario Pandapotan Simarmata on 27/10/25.
//

import SwiftUI

struct PostFormView: View {
    @State private var comment: String = ""

    var body: some View {
        VStack(spacing: 36) {
            TextField("",
                      text: $comment,
                      prompt: Text("Add Something...")
            )
            .foregroundStyle(.gray)
            .font(.custom(DesignFonts.InterLight, size: 11))
            HStack {
                ChipButton(title: "Camera")
                ChipButton(title: "Photos")
                ChipButton(title: "Files")
                Spacer()
                ChipButton(title: "Post",color: DesignColors.host)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .font(.system(size: 14))
        .padding(.horizontal, 20)
        .padding(.vertical, 20)
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .overlay {
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color(DesignColors.cardBorder), lineWidth: 1)
        }
        .cornerRadius(15)
        
    }
}

#Preview {
    CircleView()
}
