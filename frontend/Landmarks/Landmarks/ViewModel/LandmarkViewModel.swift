//
//  LandmarkViewModel.swift
//  Landmarks
//
//  Created by Anshul Kanwar on 31/10/23.
//

import Foundation
import OSLog

@Observable
class LandmarkViewModel {
    private(set) var landmarks: [Landmark] = []
    
    func fetchLandmarks() async {
        let url = URL(string: "http://127.0.0.1:8080/landmarks")!
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("An error occured.")
                return
            }
            
            landmarks = try JSONDecoder().decode([Landmark].self, from: data)
        } catch {
            print("An error occured: \(error)")
        }
    }
}
