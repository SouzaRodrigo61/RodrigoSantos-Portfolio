//
//  MapContentView.swift
//  RodrigoSantos-Portfolio
//
//  Created by Rodrigo Santos on 01/06/20.
//  Copyright © 2020 Rodrigo Santos. All rights reserved.
//

import MapKit
import SwiftUI

struct MapContentView: View {
    @State private var centerCoordinate = CLLocationCoordinate2D()
    
    var body: some View {
        ZStack {
            MapView (centerCoordinator: $centerCoordinate)
                .edgesIgnoringSafeArea(.all)
            Circle()
                .fill()
                .opacity(0.3)
                .frame(width: 32, height: 32)
            
            VStack {
                Spacer()
                Button(action: {}) {
                    Image(systemName: "plus")
                }
                .padding()
                .background(Color.black.opacity(0.75))
                .foregroundColor(.white)
                .clipShape(Circle())
                .padding(.trailing)
            }
        }
    }
}


#if DEBUG
struct MapContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MapContentView()
              .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
              .previewDisplayName("iPhone 8")
              .colorScheme(.light)

           MapContentView()
              .previewDevice(PreviewDevice(rawValue: "iPhone XS Max"))
              .previewDisplayName("iPhone XS Max")
              .colorScheme(.dark)
        }
    }
}
#endif
