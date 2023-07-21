//
//  SwiftUIView.swift
//  projectE1
//
//  Created by Lena Pianfetti on 7/21/23.
//

import SwiftUI
import UIKit

struct ImagePicker: UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    @Binding var isImagePickerShowing: Bool
    @Binding var selectedImage: UIImage?
    var sourceType: UIImagePickerController.SourceType
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = self.sourceType
        imagePicker.delegate = context.coordinator // Set the delegate here
        
        return imagePicker
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
}

class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    let parent: ImagePicker
    
    init(_ parent: ImagePicker) {
        self.parent = parent
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        parent.isImagePickerShowing = false
        
        if let image = info[.originalImage] as? UIImage {
            DispatchQueue.main.async { [self] in
                self.parent.selectedImage = image
            }
        }
    }
}

