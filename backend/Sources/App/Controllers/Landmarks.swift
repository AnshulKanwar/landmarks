//
//  File.swift
//  
//
//  Created by Anshul Kanwar on 31/10/23.
//

import Vapor

struct LandmarksController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let landmarks = routes.grouped("landmarks")
        landmarks.get(use: index)
        
        landmarks.group(":id") { todo in
            todo.get(use: show)
        }
    }
    
    func index(req: Request) async throws -> [Landmark] {
        try await Landmark.query(on: req.db).all()
    }
    
    func show(req: Request) async throws -> Landmark {
        guard let landmark = try await Landmark.find(req.parameters.get("id"), on: req.db) else {
            throw Abort(.notFound)
        }
        
        return landmark
    }
}
