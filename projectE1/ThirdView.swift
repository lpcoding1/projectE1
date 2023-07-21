//
//  ThirdView.swift
//  projectE1
//
//  Created by Lena Pianfetti on 7/17/23.
//
import SwiftUI

struct ThirdView: View {
    @State var selectedImage: UIImage?
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var isImagePickerShowing = false // Move the isImagePickerShowing state here
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack {
                    HStack {
                        //Logo
                        Image("logo")
                            .resizable(resizingMode: .stretch)
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(360)
                        
                        Spacer()
                            .frame(width: 60.0)
                        
                        //App Header
                        Text("Gallery")
                            .fontWeight(.bold)
                            .font(.title)
                            .foregroundColor(Color.black)
                            .multilineTextAlignment(.center)
                        
                        
                        Spacer()
                    }
                    .padding()
                }
                .background(Color(hue: 0.431, saturation: 0.593, brightness: 0.485))
                .frame(width: 395, height: 65.0)
                
                Spacer()
                
                NavigationLink(destination: ContentView()) {
                    Text("Home Page")
                }
                
                if let image = selectedImage {
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                
                Button("Select a Photo") {
                    self.sourceType = .photoLibrary
                    // Show the ImagePicker sheet when the button is tapped
                    isImagePickerShowing = true
                }
                
                Spacer()
            }
        }
        // Present the ImagePicker sheet using sheet modifier
        .sheet(isPresented: $isImagePickerShowing) {
            ImagePicker(isImagePickerShowing: $isImagePickerShowing, selectedImage: $selectedImage, sourceType: self.sourceType)
        }
    }
}

struct ThirdView_Previews: PreviewProvider {
    static var previews: some View {
        ThirdView()
    }
}
