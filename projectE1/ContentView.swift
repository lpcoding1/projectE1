//
//  ContentView.swift
//  projectE1
//
//  Created by Lena Pianfetti on 7/14/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            
            //App Header
            Text("PaintedPortals")
            
            //Collection Nav. link
                NavigationLink(destination: SecondView()) {
                    Text("Collections")
                }
                
            //Gallery Nav. link
                NavigationLink(destination: ThirdView()) {
                    Text("Gallery")
                }
                
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    } 
}
