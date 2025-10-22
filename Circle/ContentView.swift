//
//  ContentView.swift
//  Circle
//
//  Created by Mario Pandapotan Simarmata on 22/10/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var currentIndex: Int = 0
    @State private var selectedTab: String = "About"
    
    var tabMenu = ["Overview", "Posts", "Resource",]
    
    var body: some View {
        NavigationStack{
            ZStack {
                // background Color
                VStack {
                    
                }
                .frame(maxWidth: .infinity)
                .frame(maxHeight: .infinity)
                .background(
                    LinearGradient(
                        colors: [Color(.background2), Color(.background1)],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                
                // TabView
                VStack{
                    HStack (spacing: 20){
                        ForEach(Array(tabMenu.enumerated()), id: \.offset) { index, item in
                            TabService(text: item, isSelected: currentIndex == index)
                                .onTapGesture {
                                    withAnimation (.interactiveSpring){
                                        currentIndex = index
                                    }
                                }
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity,alignment: .leading)
                    
                    //Views
                    VStack{
                        TabView(selection: $currentIndex) {
                            OverviewView()
                                .tag(0)
                            Text("Search View")
                                .tag(1)
                            Text("Profile View")
                                .tag(2)
                        }.tabViewStyle(.page)
                    }
                } .toolbar {
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
        }
    }
}
struct TabService: View {
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
        }.fixedSize()
    }
}


#Preview {
    ContentView()
}

