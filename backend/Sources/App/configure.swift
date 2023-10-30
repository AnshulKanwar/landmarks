import Vapor
import Fluent
import FluentSQLiteDriver

// configures your application
public func configure(_ app: Application) async throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
    
    app.databases.use(.sqlite(.file("landmarks.sqlite")), as: .sqlite)
    
    app.migrations.add(CreateLandmark())

    // register routes
    try routes(app)
}
