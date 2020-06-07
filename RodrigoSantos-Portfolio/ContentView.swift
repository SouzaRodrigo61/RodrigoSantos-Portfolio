//
//  ContentView.swift
//  RodrigoSantos-Portfolio
//
//  Created by Rodrigo Santos on 18/05/20.
//  Copyright © 2020 Rodrigo Santos. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HomeView()
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      Group {
         ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
            .previewDisplayName("iPhone SE")

         ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone XS Max"))
            .previewDisplayName("iPhone XS Max")
      }
   }
}
#endif


// MARK: - Home View
struct HomeView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @State var color = 0
    @State var height = UIScreen.main.bounds.height
    @State var width = UIScreen.main.bounds.width
    
    
    var body: some View {
        VStack {
            ZStack(alignment: .top) {
                
                VStack {
                    Image(self.color == 0 ? "lamp1" : "lamp2")
                    .resizable()
                    .frame(height: 300)
                    
                    HStack(spacing: 20) {
                        
                        
                        // Color 00
                        Button(action: {
                            self.color = 0
                        }) {
                            VStack(spacing: 20) {
                                ZStack {
                                    Circle()
                                        .fill(Color.yellow)
                                        .frame(width: 20, height: 20)
                                    Circle()
                                        .stroke(self.color == 0 ? Color.white : Color.orange, lineWidth: 2)
                                        .frame(width: 30, height: 30)
                                }
                                Text("Yellow")
                                    .foregroundColor(.white)
                                    .font(.caption)
                            }
                        }
                        
                        // Color 01
                        Button(action: {
                            self.color = 1
                        }) {
                            VStack(spacing: 20) {
                                ZStack {
                                    Circle()
                                        .fill(Color.orange)
                                        .frame(width: 20, height: 20)
                                    Circle()
                                        .stroke(self.color == 0 ? Color.white : Color.orange, lineWidth: 2)
                                        .frame(width: 30, height: 30)
                                }
                                Text("Orange")
                                    .foregroundColor(.white)
                                    .font(.caption)
                            }
                        }
                    }
                    .padding(.top, 15)
                    .padding(.bottom, 10)
                }
                
                HStack {
                    Button(action: {}) {
                        Image("back").renderingMode(.original)
                            .padding()
                    }
                    .padding(.leading, 10)
                    .padding(.top, 20)
                    Spacer()
                    Button(action: {}) {
                        Image("cart").renderingMode(.original)
                            .padding()
                    }
                    .padding(.horizontal, 10)
                    .padding(.vertical, 20)
                    .background(Color.white)
                    .clipShape(CustomShape(corner: .bottomLeft, redii: 35))
                }
                
            }
            .background(self.color == 0 ? Color.yellow : Color.orange)
            .clipShape(CustomShape(corner: .bottomLeft, redii: 55))

            ScrollView(self.height > 800 ? .init() : .vertical, showsIndicators: false) {
                
                VStack{
                    
                    HStack{
                        
                        Text("Melodi Lamp")
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Spacer()
                        
                        Button(action: {
                            
                        }) {
                            
                            Image("heart")
                                .renderingMode(.original)
                                .padding()
                        }
                        .background(self.color == 0 ? Color.yellow : Color.orange)
                        .clipShape(Circle())
                        
                    }
                    .padding(.horizontal, 35)
                    .padding(.top,25)
                    
                    
                    Text("The lampshape provides directional lighting above the dining table and pleasant diffused light throught the room")
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.gray)
                        .padding(.horizontal, 30)
                        .padding(.top,20)
                    
                    Spacer(minLength: 0)
                    
                    HStack(spacing: 10){
                        
                        Button(action: {
                            
                        }) {
                            
                            VStack{
                                
                                Image("mat1")
                                    .renderingMode(.original)
                                
                                Text("22 W")
                                    .fontWeight(.bold)
                                    .foregroundColor(colorScheme == .dark ? .gray : .black)
                            }
                            .padding()
                        }
                        .background(colorScheme == .dark ? Color.white : Color.black.opacity(0.06))
                        .cornerRadius(12)
                        
                        Button(action: {
                            
                        }) {
                            
                            VStack{
                                
                                Image("mat2")
                                    .renderingMode(.original)
                                    .foregroundColor(colorScheme == .dark ? .gray : .black)
                                
                                Text("24 CM")
                                    .fontWeight(.bold)
                                    .foregroundColor(colorScheme == .dark ? .gray : .black)
                            }
                            .padding()
                        }
                        .background(colorScheme == .dark ? Color.white : Color.black.opacity(0.06))
                        .cornerRadius(12)
                        
                        Button(action: {
                            
                        }) {
                            
                            VStack{
                                
                                Image("mat3")
                                    .renderingMode(.original)
                                
                                Text("26 CM")
                                    .fontWeight(.bold)
                                    .foregroundColor(colorScheme == .dark ? .gray : .black)
                            }
                            .padding()
                        }
                        .background(colorScheme == .dark ? Color.white : Color.black.opacity(0.06))
                        .cornerRadius(12)
                        
                        Button(action: {
                            
                        }) {
                            
                            VStack{
                                
                                Image("mat4")
                                    .renderingMode(.original)
                                
                                Text("1.6 M")
                                    .fontWeight(.bold)
                                    .foregroundColor(colorScheme == .dark ? .gray : .black)
                            }
                            .padding()
                        }
                        .background(colorScheme == .dark ? Color.white : Color.black.opacity(0.06))
                        .cornerRadius(12)
                    }
                    .padding(.top, 20)
                    .padding(.bottom, 25)
                    
                    Spacer(minLength: 0)
                }
            }
            
            HStack {
                
                
                Text(self.color == 0 ? "$12.99" : "$45.00")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.leading, 35)
                    .padding(.bottom, 20)
                
                Spacer()
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Add to Card")
                        .foregroundColor(.black)
                        .padding(.vertical, 20)
                        .padding(.horizontal, 30)
                }
                .background(self.color == 0 ? Color.yellow : Color.orange)
                .clipShape(CustomShape(corner: .topLeft, redii: 55))
            
    
            }
            
            
        Spacer(minLength: 0)
        }.edgesIgnoringSafeArea(.all)
        .statusBar(hidden: true)
            .animation(.default
        )
    }
}

// MARK: - Custom Shape
struct CustomShape: Shape {
    
    var corner: UIRectCorner
    var redii: CGFloat
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corner, cornerRadii: CGSize(width: redii, height: redii))
        
        return Path(path.cgPath)
    }
}


// MARK: - Host
class Host : UIHostingController<ContentView> {
    
    override var prefersHomeIndicatorAutoHidden: Bool{
        
        return true
    }
}
