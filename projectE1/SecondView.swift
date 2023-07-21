//
//  SecondView.swift
//  projectE1
//
//  Created by Lena Pianfetti on 7/17/23.
//

import SwiftUI

struct Group {
    let name: String
}

struct SecondView: View {
    @State private var groupName: String = ""
    @State private var groups: [Group] = []
    
    var body: some View {
        NavigationView {
            VStack {
            VStack {
                HStack {
                    //Logo
                    Image("logo")
                        .resizable(resizingMode: .stretch)
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(360)
                    
                    Spacer()
                        .frame(width: 53.0)
                    
                    //App Header
                    Text("Collection")
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
            
            
            TextField("Enter name", text: $groupName)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button(action: createGroup) {
                Text("Create Collection")
                    .foregroundColor(Color(red: 0.368, green: 0.569, blue: 0.482))
                    .padding()
                    .cornerRadius(10)
            }
            
            List(groups, id: \.name) { group in
                NavigationLink(destination: GroupDetailView(group: group)) {
                    Text(group.name)
                }
            }
            .listStyle(PlainListStyle())
            
            Spacer()
        }
        
    }
}
    
    private func createGroup() {
        if !groupName.isEmpty {
            let newGroup = Group(name: groupName)
            groups.append(newGroup)
            groupName = ""
        }
    }
}

struct GroupDetailView: View {
    
    // Image URL
    @State private var imageURL: String = ""
    @State private var imageCollections: [String] = []
    
    let group: Group
    
    var body: some View {
        HStack {
            
            // Display image button
            TextField("Enter Image URL", text: $imageURL)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button("Add Image", action: addImageToGallery)
                .padding()
                .accentColor(/*@START_MENU_TOKEN@*/Color(red: 0.195, green: 0.486, blue: 0.363)/*@END_MENU_TOKEN@*/)
                
        }
        
        // Displaying the gallery of images + scroll
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
                ForEach(imageCollections, id: \.self) { imageUrl in
                    let image = fetchImageFromURL(urlString: imageUrl)
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding()
                }
            }
        }
            .navigationTitle(group.name)
    }
    
    // Function to add the image url
    private func addImageToGallery() {
        imageCollections.append(imageURL)
        imageURL = ""
    }
    
    //Function to fetch the image from the URL
    private func fetchImageFromURL(urlString: String) -> UIImage {
        guard let url = URL(string: urlString),
              let data = try? Data(contentsOf: url),
              let image = UIImage(data: data)
        else {
            return UIImage()
        }
        return image
    }
    
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
    }
}
