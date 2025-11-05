//
//  FluidImages.swift
//  Circle
//
//  Created by Mario Pandapotan Simarmata on 31/10/25.
//

import SwiftUI

struct FluidImages: View {
    @Binding var photos: [String]
    var deletable: Bool = false
    
    private var mediaMaxWidthLeft: CGFloat {
        switch photos.count {
        case 1: return 224
        case 2: return 170
        case 3: return 224
        case 4: return 170
        default: return 55
        }
    }
    private var mediaMaxWidthRight: CGFloat {
        switch photos.count {
        case 1: return 0
        case 2: return 170
        case 3: return 121
        case 4: return 170
        default: return 55
        }
    }
    
    private var mediaMaxHeightLeft: CGFloat {
        switch photos.count {
        case 1...2: return 129
        case 3...4: return 139
        default: return 55
        }
    }
    
    private var mediaMaxHeightRight: CGFloat {
        switch photos.count {
        case 1...2: return 129
        case 3...4: return 139
        default: return 55
        }
    }
    
    var body: some View {
        HStack(spacing: 15) {
            if photos.count < 5 {
                VStack(spacing: 15) {
                    if photos.count > 0 {
                        ZStack(alignment: .topTrailing) {
                            fluidImage(photos[0])
                            deleteButton(index: 0)
                        }
                    }
                    if photos.count > 3 {
                        ZStack(alignment: .topTrailing) {
                            fluidImage(photos[3])
                            deleteButton(index: 3)
                        }
                    }
                }
                .frame(maxHeight: mediaMaxHeightLeft)
                .frame(maxWidth: mediaMaxWidthLeft)
                
                VStack(spacing: 15) {
                    if photos.count > 1 {
                        ZStack(alignment: .topTrailing) {
                            fluidImage(photos[1])
                            deleteButton(index: 1)
                        }
                    }
                    
                    if photos.count > 2 {
                        ZStack(alignment: .topTrailing) {
                            fluidImage(photos[2])
                            deleteButton(index: 2)
                        }
                    }
                }
                .frame(maxHeight: mediaMaxHeightRight)
                .frame(maxWidth: mediaMaxWidthRight)
                
            } else {
                HStack {
                    ForEach(photos.indices, id: \.self) { index in
                        ZStack(alignment: .topTrailing) {
                            fluidImage(photos[index])
                                .frame(maxHeight: 55)
                                .frame(maxWidth: 48)
                            
                            deleteButton(index: index)
                        }
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    private func fluidImage(_ nameOrPath: String) -> some View {
        if FileManager.default.fileExists(atPath: nameOrPath) {
            // ✅ image dari local path
            if let uiImage = UIImage(contentsOfFile: nameOrPath) {
                Image(uiImage: uiImage)
                    .resizable()
                    .overlay {
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color(DesignColors.cardBorder), lineWidth: 1)
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 15))
            }
        } else {
            // ✅ image dari asset
            Image(nameOrPath)
                .resizable()
                .overlay {
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color(DesignColors.cardBorder), lineWidth: 1)
                }
                .clipShape(RoundedRectangle(cornerRadius: 15))
        }
    }

    
    @ViewBuilder
    private func deleteButton(index: Int) -> some View {
        if deletable {
            Image(DesignImages.closeIcon)
                .padding(8)
                .onTapGesture {
                    photos.remove(at: index)
                }
        }
    }
}
