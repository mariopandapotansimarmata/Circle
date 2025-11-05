//
//  MediaView.swift
//  Circle
//
//  Created by Mario Pandapotan Simarmata on 29/10/25.
//

import SwiftUI

struct MediaView: View {
    @State private var currentIndex: Int = 1
    var mediaType: MediaType
    var title: String
    var tabMenu = ["Photos", "Videos",]
    
    var body: some View {
        VStack {
            HStack (spacing: 28 ) {
                Image(mediaType == .host ? "profileHost" : "circleLogo")

                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipShape(.circle)
                    .frame(width:70,height: 70)
                
                VStack (alignment: .leading, spacing: 4){
                    Text(title)
                    HStack(spacing: 20) {
                        ForEach(Array(tabMenu.enumerated()), id: \.offset) { index, item in
                            TabServiceView(text: item, isSelected: currentIndex == index)
                                .onTapGesture {
                                    withAnimation (.interactiveSpring){
                                        currentIndex = index
                                    }
                                }
                        }
                    }
                    .frame(maxWidth: .infinity,alignment: .leading)
                }
            }
            .padding(.horizontal,40)
            
            TabView(selection: $currentIndex) {
                VideoPageView()
                    .tag(0)
                VideoPageView()
                    .tag(1)
            }
            .frame(maxWidth: .infinity,alignment: .leading)
            .tabViewStyle(.page)
            .onAppear {
                UIPageControl.appearance().isHidden = true
            }
        }
        .padding(.top, 2)
        .frame(maxHeight: .infinity)
        .background(LinearGradient(
            colors: [Color(.background2), Color(.background1)],
            startPoint: .top,
            endPoint: .bottom
        ))
        .edgesIgnoringSafeArea([])
        .tint(.black)
        .ignoresSafeArea(.container, edges: .bottom)
    }
}

#Preview {
    MediaView(mediaType: .host, title: "Hello")
}
