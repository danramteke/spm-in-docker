import Vapor

final class HelloWorldController {
    func hello(req: Request) -> EventLoopFuture<View> {
        req.view.render("HelloWorld/hello")
    }
}
