//
//  ImagePicker.swift
//  Circle
//
//  Created by Mario Pandapotan Simarmata on 05/11/25.
//

import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    @Environment(\.dismiss) var dismiss
    var sourceType: UIImagePickerController.SourceType
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
        init(_ parent: ImagePicker) { self.parent = parent }

        func imagePickerController(
            _ picker: UIImagePickerController,
            didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]
        ) {
            if let image = info[.originalImage] as? UIImage {
                if let path = saveImageToDocument(image: image) {
                    if parent.photos.count < 5 {
                        parent.photos.append(path)
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
        return url.path
    } catch {
        print("Error saving file:", error)
        return nil
    }
}

