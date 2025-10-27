//
//  CircleView.swift
//  Circle
//
//  Created by Mario Pandapotan Simarmata on 22/10/25.
//

import SwiftUI

struct CircleView: View {
    
    @State private var currentIndex: Int = 1
    
    var tabMenu = ["Overview", "Posts", "Resource",]
    
    var body: some View {
        NavigationStack{
            ZStack {
                LinearGradient(
                    colors: [Color(.background2), Color(.background1)],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                // TabView
                VStack(spacing: 0) {
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
                    .padding(.horizontal, 20)
                    .padding(.top, 20)
                    .frame(maxWidth: .infinity,alignment: .leading)
                    
                    //Views
                    TabView(selection: $currentIndex) {
                        OverviewView()
                            .tag(0)
                        PostView()
                            .tag(1)
                        Text("Posts")
                            .tag(2)

                    }
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .tabViewStyle(.page)
                    .onAppear {
                        UIPageControl.appearance().isHidden = true
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        HStack{
                            Image(DesignImages.circleLogo)
                            Text("Circle")
                                .font(Font.custom(DesignFonts.InterBold, size: 17).weight(.bold))
                        }
                    }
                    
                    ToolbarItem(placement: .topBarTrailing) {
                        HStack{
                            Image(DesignImages.logoutIcon)
                        }
                    }
                    
                }
            }
            .ignoresSafeArea(.container, edges: .bottom)
        }
    }
}


#Preview {
    CircleView()
}

