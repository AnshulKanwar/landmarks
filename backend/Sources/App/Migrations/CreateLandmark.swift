//
//  File.swift
//  
//
//  Created by Anshul Kanwar on 31/10/23.
//

import Fluent

struct CreateLandmark: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema("landmarks")
            .id()
            .field("name", .string)
            .field("park", .string)
            .field("state", .string)
            .field("description", .string)
            .field("isFavorite", .string)
            .field("isFeatured", .string)
            .field("category", .string)
            .field("imageName", .string)
            .field("coordinates", .string)
            .create()
        
        let landmarks = Landmark.landmarks
        try await landmarks.create(on: database)
    }
    
    func revert(on database: Database) async throws {
        try await database.schema("landmarks").delete()
    }
}
