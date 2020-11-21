import Vapor

public func configure(_ app: Application) throws {  
    app.get("") { _ in
        return "Hello world"
    }
}
