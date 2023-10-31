//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by Anshul Kanwar on 31/10/23.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark
    
    var body: some View {
        HStack {
            AsyncImage(url: landmark.imageURL, scale: 2) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                }
            }
            .frame(width: 50, height: 50)
            
            Text(landmark.name)
            
            Spacer()
        }
    }
}

#Preview {
    Group {
        LandmarkRow(landmark: Landmark.sampleLandmarks[0])
        LandmarkRow(landmark: Landmark.sampleLandmarks[1])
    }
}
