//
//  PostFormView.swift
//  Circle
//
//  Created by Mario Pandapotan Simarmata on 27/10/25.
//

import SwiftUI

struct PostFormView: View {
    @Binding var photos: [String]
    @Binding var comment: String
    @Binding var listPosts: [Post]
    @FocusState.Binding var focusField: Bool
    @State private var isShowCamera = false
    @State private var image: UIImage? = nil

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
                ChipButton(title: "Photos", color: !photos.isEmpty ? DesignColors.photoChipBack : DesignColors.whiteColor)
                    .onTapGesture {
                        let image = "image1"
                        if photos.count < 5 {
                            photos.append(image)
                        }
                    }
                
                ChipButton(title: "Files")
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
    }
}

#Preview {
    CircleView()
}

struct ImagePicker: UIViewControllerRepresentable {
    @Environment(\.dismiss) var dismiss
    var sourceType: UIImagePickerController.SourceType = .camera
    @Binding var photos: [String]

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = sourceType
        picker.delegate = context.coordinator
        picker.modalPresentationStyle = .fullScreen
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        let parent: ImagePicker
        init(_ parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(
            _ picker: UIImagePickerController,
            didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]
        ) {
            if let image = info[.originalImage] as? UIImage {
                if let path = saveImageToDocument(image: image) {
                    if parent.photos.count < 5 {
                        parent.photos.append(path)   // ✅ langsung masuk ke array
                    }
                }
            }
            parent.dismiss()
        }
    }
}

func saveImageToDocument(image: UIImage) -> String? {
    guard let data = image.jpegData(compressionQuality: 0.8) else { return nil }

    let filename = UUID().uuidString + ".jpg"
    let url = FileManager.default
        .urls(for: .documentDirectory, in: .userDomainMask)[0]
        .appendingPathComponent(filename)

    do {
        try data.write(to: url)
        return url.path   // ✅ return String
    } catch {
        print("❌ Error saving file:", error)
        return nil
    }
}
