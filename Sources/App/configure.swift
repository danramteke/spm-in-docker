import Vapor
import Leaf

public func configure(_ app: Application) throws {
    app.views.use(.leaf)
    try routes(app)
}
