//
//  HomeContentView.swift
//  RodrigoSantos-Portfolio
//
//  Created by Rodrigo Santos on 28/05/20.
//  Copyright © 2020 Rodrigo Santos. All rights reserved.
//

import SwiftUI

// MARK: - Home View
struct HomeContentView: View {
    @ObservedObject var sot: HomeSourceOfTruth
    
    @State var time = Timer.publish(every: 0.1, on: .current, in: .tracking).autoconnect()
    @State var show = false
    
    var body: some View {
        
        ZStack(alignment: .top, content: {
            ScrollView(.vertical, showsIndicators: false, content: {
                VStack {
                    
                    GeometryReader { g in
                        
                        Image ("poster")
                            .resizable()
                            .offset(y: g.frame(in: .global).minY > 0 ?
                                -g.frame(in: .global).minY : 0)
                            .frame(height: g.frame(in: .global).minY > 0 ?  UIScreen.main.bounds.height / 2.2  +
                                g.frame(in: .global).minY          :
                                UIScreen.main.bounds.height / 2.2)
                            .onReceive(self.time) { (_) in
                                let y = g.frame(in: .global).minY
                                
                                if -y > (UIScreen.main.bounds.height / 2.2) - 50 {
                                    withAnimation(){
                                        self.show = true
                                    }
                                }else{
                                    withAnimation(){
                                        self.show = false
                                    }
                                }
                        }
                        
                    }
                    .frame(height: UIScreen.main.bounds.height / 2.2)
                    
                    VStack {
                        HStack {
                            Text("New Game We Love")
                                .font(.title)
                                .fontWeight(.bold)
                            
                            Spacer()
                            
                            Button(action: {}) {
                                Text("See All")
                                    .fontWeight(.bold)
                            }
                        }
                        
                        VStack (spacing: 20) {
                            ForEach(data) { item in
                                CardView(data: item)
                            }
                        }
                        .padding(.top)
                    }
                    .padding()
                    
                    Spacer()
                }
            })
            
            if (self.show) {
                TopView()
            }
            
        })
            .edgesIgnoringSafeArea(.all)
        
        
    }
}


// MARK: - Card View
struct CardView: View {
    
    var data: Card
    
    var body: some View {
        HStack(alignment: .top, spacing: 20) {
            Image(self.data.image)
            VStack(alignment: .leading, spacing: 6) {
                Text(self.data.title)
                    .fontWeight(.bold)
                Text(self.data.title)
                    .font(.caption)
                    .foregroundColor(.gray)
                
                HStack(spacing: 12) {
                    Button(action: {}) {
                        Text("Get")
                            .padding(.vertical, 10)
                            .padding(.horizontal, 25)
                            .background(Color.primary.opacity(0.06))
                            .clipShape(Capsule())
                    }
                    Text("In-App\n Purchases")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                
            }
            
            Spacer(minLength: 0)
        }
    }
}


// MARK: - Top View
struct TopView: View {
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 12) {
                HStack(alignment: .top) {
                    Image("apple")
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 25, height: 30)
                        .foregroundColor(.primary)
                    
                    Text("Arcade")
                        .font(.title)
                        .fontWeight(.bold)
                }
                
                Text("One mounth free, then $4.99/month")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            Spacer(minLength: 0)
            
            NavigationLink(destination: MapContentView()) {
                Text("Try it free")
                    .foregroundColor(.white)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 25)
                    .background(Color.blue)
                    .clipShape(Capsule())
            }
        }
        .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top == 0 ? 15 : (UIApplication.shared.windows.first?.safeAreaInsets.top)! + 5)
        .padding(.horizontal)
        .padding(.bottom)
        .background(BlurBG())
    }
}


// MARK: - Blur Background
struct BlurBG : UIViewRepresentable {
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        
        // for dark mode adoption...
        
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .systemMaterial))
        
        return view
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        
        
    }
}


#if DEBUG
struct HomeContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeContentView(sot: HomeSourceOfTruth())
                .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
                .previewDisplayName("iPhone 8")
            
            HomeContentView(sot: HomeSourceOfTruth())
                .previewDevice(PreviewDevice(rawValue: "iPhone XS Max"))
                .previewDisplayName("iPhone XS Max")
        }
    }
}
#endif


// MARK: - Data local
var data = [
    
    Card(id: 0, image: "g1", title: "Zombie Gunship Survival", subTitle: "Tour the apocalypse"),
    Card(id: 1, image: "g2", title: "Portal", subTitle: "Travel through dimensions"),
    Card(id: 2, image: "g3", title: "Wave Form", subTitle: "Fun enagaging wave game"),
    Card(id: 3, image: "g4", title: "Temple Run", subTitle: "Run for your life"),
    Card(id: 4, image: "g5", title: "World of Warcrat", subTitle: "Be whoever you want"),
    Card(id: 5, image: "g6", title: "Alto’s Adventure", subTitle: "A snowboarding odyssey"),
    Card(id: 6, image: "g7", title: "Space Frog", subTitle: "Jump and have fun"),
    Card(id: 7, image: "g8", title: "Dinosaur Mario", subTitle: "Keep running")
]

