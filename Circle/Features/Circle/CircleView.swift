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
    
    
    @State var host: Host = Host(
        name: "Jane Doe",
        title: "30-Day Mindfulness Challenge",
        description: "This 30-minute mindfulness practice is designed to help you slow down, reset, and reconnect with yourself. Together we can be stronger and be more powerful",
        posts: [
            Post(name: "Sarah Pearson",
                 createdAt: "3d",
                 photos: ["image2", "image1", "image3","image8", "image5"],
                 replies: [Replies(name: "LeBron James",
                                   createdAt: "2d",
                                   likes: 14),
                           Replies(name: "Cristiano Ronaldo ",
                                   createdAt: "3d",
                                   likes: 12),
                           Replies(name: "Robinho Alaves",
                                   createdAt: "2d",
                                   likes: 16),
                 ],
                 likes: 15,
                 isEdited: false,
                 isLockedComment: false,
                note: "Maecenas pulvinar ante ex, ut tristique odio varius sollicitudin. Praesent id ornare ante. Nam lobortis tempus luctus. Vivamus nunc turpis, efficitur eu tincidunt id, sodales sodales dui. Ut sollicitudin nibh id mi mollis, venenatis congue eros interdum. Maecenas ex erat, tincidunt malesuada "
                ),
            Post(name: "Mario Pandapotan",
                 createdAt: "1d",
                 photos: [],
                 replies: [Replies(name: "Stanford Harris",
                                   createdAt: "4d",
                                   likes: 9)],
                 likes: 10,
                 isEdited: false,
                 isLockedComment: false,
                 note: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."),
            Post(name: "Xabi Alonso",
                 createdAt: "3d",
                 photos: [],
                 replies: [Replies(name: "Borris Diaw",
                                   createdAt: "4d",
                                   likes: 2)],
                 likes: 20,
                 isEdited: false,
                 isLockedComment: false,
                 note: "Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Proin facilisis, nisl eget vehicula rutrum, ipsum ipsum consectetur metus, non rhoncus est augue vitae metus. Suspendisse potenti. In hac habitasse platea dictumst. Sed ac purus ac dolor malesuada ultricies."),
            
        ]
    )
    
    var body: some View {
        NavigationStack {
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
                        OverviewView($host)
                            .tag(0)
                        PostView(listPosts: $host.posts)
                            .tag(1)
                        ResourceView()
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
        .tint(.black)
    }
}


#Preview {
    CircleView()
}

