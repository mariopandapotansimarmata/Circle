//
//  ResourceView.swift
//  Circle
//
//  Created by Mario Pandapotan Simarmata on 29/10/25.
//

import SwiftUI

struct ResourceView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                ResourceCardView(title: "Host Media")
                ResourceCardView(title: "Host Files",typeFile: .file)
                ResourceCardView(title: "Host Files",background1: Color(DesignColors.purple300), background2: Color(DesignColors.purple300))
                ResourceCardView(title: "Host Files",background1: Color(DesignColors.purple300),typeFile: .file)
            }
        }
        .contentMargins(20)
    }
}

#Preview {
    CircleView()
}

enum TypeFile {
    case media
    case file
}
struct ResourceCardView: View {
    var title: String
    var listHostMedia: [String] = ["image1", "image2", "image3"]
    var background1: Color?
    var background2: Color?
    var typeFile: TypeFile = .media
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(title)
                .font(.callout).fontWeight(.semibold)
            
            HStack (alignment: .center, spacing: 10){
                if typeFile == .media {
                    ForEach(listHostMedia, id:\.self){ item in
                        Image(item)
                            .resizable()
                            .scaledToFill()
                            .frame(height:124)
                    }
                } else {
                    ForEach(1..<3){ item in
                       fileBox
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.vertical, 15)
            .padding(.horizontal, 8)
            .background(background2 ?? .white)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color(DesignColors.cardBorder), lineWidth: 1)
            )
            .clipShape(RoundedRectangle(cornerRadius: 20))
            
            NavigationLink{
                MediaView()
            } label: {
                HStack {
                    Text("See All")
                        .font(.caption2)
                        .foregroundStyle(Color(DesignColors.seeAll))
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
        }
        .padding(20)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(background1 ?? .white)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color(DesignColors.cardBorder), lineWidth: 1)
        )
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
    
    var fileBox: some View {
        Text("fileName.Type")
            .font(.custom(DesignFonts.InterMedium, size: 11))
            .frame(height: 24)
            .frame(width: 120)
            .padding(.vertical, 12)
            .padding(.horizontal, 10)
            .background(Color(DesignColors.fileBox))
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color(DesignColors.cardBorder), lineWidth: 1)
            )
            .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}
