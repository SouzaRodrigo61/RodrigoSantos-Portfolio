//
//  MapCoordinateSpan.swift
//  RodrigoSantos-Portfolio
//
//  Created by Rodrigo Santos on 01/06/20.
//  Copyright © 2020 Rodrigo Santos. All rights reserved.
//

import MapKit


class LandmarkAnnotation: NSObject, MKAnnotation {
    let title: String?
    let subtitle: String?
    let coordinate: CLLocationCoordinate2D

    init(title: String?,
         subtitle: String?,
         coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
    }
    
    static func requestMockData()-> [LandmarkAnnotation]{
        return [
            LandmarkAnnotation(title: "Bengalore",
                               subtitle:"Bengaluru (also called Bangalore) is the capital of India's southern Karnataka state.",
                               coordinate: .init(latitude: 12.9716, longitude: 77.5946)),
            LandmarkAnnotation(title: "Mumbai",
                               subtitle:"Mumbai (formerly called Bombay) is a densely populated city on India’s west coast",
                               coordinate: .init(latitude: 19.0760, longitude: 72.8777))
        ]
    }
}
