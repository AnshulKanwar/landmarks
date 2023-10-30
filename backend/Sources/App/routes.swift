import Vapor

func routes(_ app: Application) throws {
    app.get { req async in
        return "It works!"
    }

    app.get("hello") { req async -> String in
        "Hello, world!"
    }
}
