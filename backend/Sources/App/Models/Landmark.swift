//
//  File.swift
//  
//
//  Created by Anshul Kanwar on 30/10/23.
//

import Foundation
import Fluent

final class Landmark: Model {
    static let schema = "landmarks"
    
    @ID(custom: "id")
    var id: Int?
    
    @Field(key: "name")
    var name: String
    
    @Field(key: "park")
    var park: String
    
    @Field(key: "state")
    var state: String
    
    @Field(key: "description")
    var description: String
    
    @Field(key: "isFavorite")
    var isFavorite: Bool
    
    @Field(key: "isFeatured")
    var isFeatured: Bool
    
    @Field(key: "category")
    var category: Category
    
    enum Category: String, Codable {
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }
    
    @Field(key: "imageName")
    var imageName: String
    
    @Field(key: "coordinates")
    var coordinates: Coordinates
    
    struct Coordinates: Codable {
        var latitude: Double
        var longitude: Double
    }
}

extension Landmark {
    static var landmarks: [Landmark] {
        let currentDirecotry = FileManager.default.currentDirectoryPath
        let filePath = "\(currentDirecotry)/Resources/landmarkData.json"
        let url = URL(filePath: filePath)
        do {
            let data = try Data(contentsOf: url)
            return try JSONDecoder().decode([Landmark].self, from: data)
        } catch {
            fatalError("Could not create data: \(error)")
        }
    }
}
