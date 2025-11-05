//
//  ResourceView.swift
//  Circle
//
//  Created by Mario Pandapotan Simarmata on 29/10/25.
//

import SwiftUI

struct ResourceView: View {
    var body: some View {
        VStack{
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    ResourceCardView(title: "Host Media")
                    ResourceCardView(title: "Host Files",typeFile: .file)
                    ResourceCardView(title: "Member Media",background1: Color(DesignColors.purple300), background2: Color(DesignColors.purple300))
                    ResourceCardView(title: "Member Files",background1: Color(DesignColors.purple300),typeFile: .file)
                }
                .padding(.horizontal, 20)
            }
        }
        .contentMargins(.vertical, 20)
    }
}

#Preview {
    CircleView()
}
