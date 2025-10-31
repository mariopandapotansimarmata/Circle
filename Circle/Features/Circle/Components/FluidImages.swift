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
                        ZStack (alignment: .topTrailing) {
                            Image(photos[0])
                                .resizable()
                                .overlay {
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(Color(DesignColors.cardBorder),
                                                lineWidth: 1)
                                }
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                            if deletable {
                                Image(DesignImages.closeIcon)
                                    .padding(8)
                                    .onTapGesture {
                                        photos.remove(at: 0)
                                    }
                            }
                           
                        }
                    }
                    if photos.count > 3 {
                        ZStack (alignment: .topTrailing) {
                            Image(photos[3])
                                .resizable()
                                .overlay {
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(Color(DesignColors.cardBorder),
                                                lineWidth: 1)
                                }
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                            if deletable {
                                Image(DesignImages.closeIcon)
                                    .padding(8)
                                    .onTapGesture {
                                        photos.remove(at: 3)
                                    }
                            }
                        }
                    }
                }
                .frame(maxHeight: mediaMaxHeightLeft)
                .frame(maxWidth: mediaMaxWidthLeft)
                
                VStack(spacing: 15) {
                    if photos.count > 1 {
                        ZStack (alignment: .topTrailing) {
                            Image(photos[1])
                                .resizable()
                                .overlay {
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(Color(DesignColors.cardBorder),
                                                lineWidth: 1)
                                }
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                            if deletable {
                                Image(DesignImages.closeIcon)
                                    .padding(8)
                                    .onTapGesture {
                                        photos.remove(at: 1)
                                    }
                            }
                        }
                    }
                    
                    if photos.count > 2 {
                        ZStack (alignment: .topTrailing) {
                            Image(photos[2])
                                .resizable()
                                .overlay {
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(Color(DesignColors.cardBorder),
                                                lineWidth: 1)
                                }
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                            if deletable {
                                Image(DesignImages.closeIcon)
                                    .padding(8)
                                    .onTapGesture {
                                        photos.remove(at: 2)
                                    }
                            }
                        }
                    }
                }
                .frame(maxHeight: mediaMaxHeightRight)
                .frame(maxWidth: mediaMaxWidthRight)
            } else {
                HStack {
                    ForEach(photos.indices, id: \.self) { index in
                        let photo = photos[index]
                        ZStack(alignment: .topTrailing) {
                            Image(photo)
                                .resizable()
                                .frame(maxHeight: 55)
                                .frame(maxWidth: 48)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(Color(DesignColors.cardBorder), lineWidth: 1)
                                }
                                .clipShape(RoundedRectangle(cornerRadius: 15))

                            if deletable {
                                Image(DesignImages.closeIcon)
                                    .padding(8)
                                    .onTapGesture {
                                        photos.remove(at: index)
                                    }
                            }
                        }
                    }
                }
//                .padding(.vertical)
            }
        }
    }
}

#Preview {
    CircleView()
}
