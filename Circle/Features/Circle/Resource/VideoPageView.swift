//
//  VideoPageView.swift
//  Circle
//
//  Created by Mario Pandapotan Simarmata on 29/10/25.
//

import SwiftUI

struct VideoPageView: View {
    private let columns: [GridItem] = [
           GridItem(.flexible(), spacing: 12),
           GridItem(.flexible(), spacing: 12),
           GridItem(.flexible(), spacing: 12)
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
                               .frame(maxWidth: .infinity)
                               .clipped()
                       }
                   }
                   .padding(.horizontal,)
               }
           }
           .frame(maxHeight: .infinity)
    }
}

#Preview {
//    MediaView()
    CircleView()
}
