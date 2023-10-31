//
//  ContentView.swift
//  Landmarks
//
//  Created by Anshul Kanwar on 31/10/23.
//

import SwiftUI

struct ContentView: View {
    var landmarkViewModel = LandmarkViewModel()
    
    var body: some View {
        List(landmarkViewModel.landmarks) { landmark in
            Text(landmark.name)
        }
        .task {
            await landmarkViewModel.fetchLandmarks()
        }
    }
}

#Preview {
    ContentView()
}
