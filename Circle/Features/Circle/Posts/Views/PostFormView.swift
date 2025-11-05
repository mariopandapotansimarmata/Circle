//
//  PostFormView.swift
//  Circle
//
//  Created by Mario Pandapotan Simarmata on 27/10/25.
//

import SwiftUI
import UniformTypeIdentifiers

struct PostFormView: View {
    @Binding var photos: [String]
    @Binding var comment: String
    @Binding var listPosts: [Post]
    @FocusState.Binding var focusField: Bool
    @State private var isShowCamera = false
    @State private var isShowGalery = false
    @State private var isShowFilePicker = false
    @State private var image: UIImage? = nil
    @State private var pickedFileURL: URL?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ZStack(alignment: .leading) {
                
                TextEditor(text: $comment)
                    .focused($focusField)
                    .font(.custom(DesignFonts.InterLight, size: 11))
                    .background(.clear)
                    .padding(.vertical, -8)
                
                // Placeholder
                if comment.isEmpty {
                    Text("Add Something...")
                        .lineSpacing(0)
                        .foregroundColor(.gray)
                        .font(.custom(DesignFonts.InterLight, size: 11))
                        .onTapGesture {
                            focusField = true
                        }
                        .offset(x: 4)
                }
            }
            .fixedSize(horizontal: false, vertical: true)
            
            if !photos.isEmpty {
                FluidImages(photos: $photos, deletable: true)
            }
            
            HStack() {
                ChipButton(title: "Camera")
                    .onTapGesture {
                        isShowCamera = true
                    }
                ChipButton(title: "Photos")
                    .onTapGesture {
                        isShowGalery = true
                    }
                ChipButton(title: "Files")
                    .onTapGesture {
                        isShowFilePicker = true
                    }
                Spacer()
                ChipButton(title: "Post",color: DesignColors.host)
                    .onTapGesture {
                        let newPost = Post(name: "Mario", createdAt: "today", photos: photos, replies: [], likes: 0, isEdited: false, isLockedComment: false, note: comment)
                        
                        listPosts.insert(newPost, at: 0)
                        
                        photos = []
                        comment = ""
                        focusField = false
                    }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .font(.system(size: 14))
        .padding(.horizontal, 20)
        .padding(.top, 16)
        .padding(.bottom, 20)
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .overlay {
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color(DesignColors.cardBorder), lineWidth: 1)
        }
        .cornerRadius(15)
        .fullScreenCover(isPresented: $isShowCamera) {
            ImagePicker(sourceType: .camera, photos: $photos)
                .ignoresSafeArea()
        }
        .fullScreenCover(isPresented: $isShowGalery) {
            ImagePicker(sourceType: .photoLibrary, photos: $photos)
                .ignoresSafeArea()
        }
        .fullScreenCover(isPresented: $isShowFilePicker) {
            FilePicker(selectedURL: $pickedFileURL)
                .onDisappear {
                    guard let url = pickedFileURL else { return }
                    let ext = url.pathExtension.lowercased()
                    if ["jpg", "jpeg", "png", "heic"].contains(ext),
                       let data = try? Data(contentsOf: url),
                       let uiImage = UIImage(data: data),
                       let path = saveImageToDocument(image: uiImage) {
                        if photos.count < 5 {
                            photos.append(path)
                        }
                    } else
                    if photos.count < 5 {
                        photos.append(url.lastPathComponent)
                    }
                }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    CircleView()
}
