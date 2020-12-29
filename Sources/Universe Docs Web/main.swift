import Kitura
import KituraStencil

let router = Router()

router.add(templateEngine: StencilTemplateEngine())
router.all(middleware: StaticFileServer())

router.get("/") { request, response, next in
    let model: [String: [[String:Any]]] = ["" :[]]

    do {
        try response.render("home.stencil", context: model)
    } catch let error {
        print(error)
        response.send(json: ["Error": error.localizedDescription])
    }
    next()
}

Kitura.addHTTPServer(onPort: 80, with: router)
Kitura.run()
