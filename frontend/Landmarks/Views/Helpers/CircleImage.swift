//
//  CircleImage.swift
//  Landmarks
//
//  Created by Anshul Kanwar on 31/10/23.
//

import SwiftUI

struct CircleImage: View {
    var imageURL: URL

    var body: some View {
        AsyncImage(url: imageURL, scale: 2)
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
    }
}

#Preview {
    CircleImage(imageURL: URL(string: "http://localhost:8080/landmarks/turtlerock@2x.jpg")!)
}
