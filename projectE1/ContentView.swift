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
            VStack {
                ZStack {
                    
                    HStack {
                        //Logo
                        Image("logo")
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(360)
                        
                        Spacer()
                        
                        //App Header
                            Text("PaintedPortals")
                                .fontWeight(.bold)
                                .font(.title)
                                .foregroundColor(Color.black)

                        Spacer()
                    }
                    .padding()
                }
                .background(Color(hue: 0.431, saturation: 0.593, brightness: 0.485))
                .frame(width: 395, height: 70.0)
                
                Spacer()
                
                Text("Welcome to PaintedPortals")
                    .font(.title2)
                    .fontWeight(.medium)
                Spacer()
                    .frame(height: 10)
                
                Text("Inspiration at your fingertips")
                    .font(.callout)
                    .fontWeight(.light)
                
                Spacer()
            
                NavigationStack {
                    VStack {
                        HStack {
                            
                            Spacer()
                            //Collection Nav. link
                            NavigationLink(destination: SecondView()) {
                                Image("Placeholder")
                                    .aspectRatio(contentMode: .fit)
                                    .cornerRadius(360)
                                Text("Collections")
                                    .font(.title3)
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color.black)
                                    .frame(width: 180.0, height: 55.0)
                                    .background(Color(red: 0.498, green: 0.706, blue: 0.616))
                                    .cornerRadius(360)
                            }
                            .padding()
            
                            
                            //Gallery Nav. link
                            NavigationLink(destination: ThirdView()) {
                                Image("Placeholder")
                                    .aspectRatio(contentMode: .fit)
                                    .cornerRadius(360)
                                Text("Gallery")
                                    .font(.title3)
                                    .fontWeight(.medium)
                                    .foregroundColor(Color.black)
                                    .frame(width: 105.0, height: 55.0)
                                    .background(Color(hue: 0.426, saturation: 0.293, brightness: 0.706))
                                    .cornerRadius(360)
                            }
                            .padding()
                            Spacer()
                            
                            
                        }
                    }
                    
                }
                .frame(width: 360.0, height: 80)
                .background(Color(red: 0.195, green: 0.486, blue: 0.363))
                .cornerRadius(360)
            }
          
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    } 
}
