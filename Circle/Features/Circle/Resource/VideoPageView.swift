//
//  VideoPageView.swift
//  Circle
//
//  Created by Mario Pandapotan Simarmata on 29/10/25.
//

import SwiftUI

struct VideoPageView: View {
    @Environment(\.dismiss) var dismiss
    @State private var selectedIndex: Int? = nil
    
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
                        ZStack(alignment: .bottom) {
                            
                            Image("image\(index)")
                                .resizable()
                                .scaledToFill()
                            

                            Button {
                                if selectedIndex == index {
                                    selectedIndex = nil
                                } else {
                                    selectedIndex = index
                                }
                            } label: {
                                Image(systemName: "ellipsis")
                                    .opacity(0.8)
                                    .offset(y: -6)
                            }
                            
                            if selectedIndex == index {
                                popupMenu(index: index)
                            }
                        }
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
    
    
    // Extract menu into view
    @ViewBuilder
    func popupMenu(index: Int) -> some View {
        VStack(spacing: 10) {
            Text("Report post")
                .frame(maxWidth: .infinity)
                .font(.custom(DesignFonts.InterRegular,size: 11))
                .padding(.vertical, 3)
                .padding(.horizontal, 7)
                .background(.black)
                .foregroundStyle(.white)
                .clipShape(RoundedRectangle(cornerRadius: 5))
            
            Divider()
            
            Button {
                dismiss()
            } label:{
                Text("Delete post")
                    .frame(maxWidth: .infinity)
                    .font(.custom(DesignFonts.InterRegular,size: 11))
                    .padding(.vertical, 3)
                    .padding(.horizontal, 7)
                    .background(Color(.systemRed))
                    .foregroundStyle(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
            }
        }
        .fixedSize()
        .padding(20)
        .background(Color.white)
        .overlay {
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color(DesignColors.cardBorder), lineWidth: 1)
        }
        .cornerRadius(15)
        .offset(y: -16)
    }
}

#Preview {
    MediaView()
    //    CircleView()
}
