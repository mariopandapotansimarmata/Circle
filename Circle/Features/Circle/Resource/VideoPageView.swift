//
//  VideoPageView.swift
//  Circle
//
//  Created by Mario Pandapotan Simarmata on 29/10/25.
//

import SwiftUI

struct VideoPageView: View {
    private let columns: [GridItem] = [
           GridItem(.flexible()),
           GridItem(.flexible()),
           GridItem(.flexible())
       ]
    
    init() {
        UIScrollView.appearance().contentInsetAdjustmentBehavior = .never
    }
       
       var body: some View {
          VStack {
               ScrollView {
                   LazyVGrid(columns: columns, spacing: 12) {
                       ForEach(1..<13) { index in
                           Image("image\(index)")
                               .resizable()
                               .scaledToFill()
                               .frame(height: 163)
                               .frame(width: 103)
                               .frame(maxWidth: .infinity)
                               .clipped()
                       }
                   }
                   .padding(.horizontal, 20)
               }
           }
           .frame(maxHeight: .infinity)
           .contentMargins(.vertical,16)
    }
}

#Preview {
//    MediaView()
    CircleView()
}
