//
//  Landmark.swift
//  Landmarks
//
//  Created by Anshul Kanwar on 31/10/23.
//

import SwiftUI
import CoreLocation

struct Landmark: Decodable, Identifiable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude
        )
    }
    
    struct Coordinates: Decodable {
        var latitude: Double
        var longitude: Double
    }
}
