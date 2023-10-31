//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Anshul Kanwar on 31/10/23.
//

import SwiftUI

struct LandmarkList: View {
    let landmarkViewModel = LandmarkViewModel()
    var body: some View {
        NavigationSplitView {
            List(landmarkViewModel.landmarks) { landmark in
                NavigationLink {
                    LandmarkDetail(landmark: landmark)
                } label: {
                    LandmarkRow(landmark: landmark)
                }
            }
            .task {
                await landmarkViewModel.fetchLandmarks()
            }
            .navigationTitle("Landmarks")
        } detail: {
            Text("Select a Landmark")
        }
    }
}
