import Vapor

func routes(_ app: Application) throws {
    app.get("", use: HelloWorldController().hello)
}
