import Kitura
import KituraStencil

#if os(Linux)

let myCertFile = "/tmp/Creds/cert.pem"
let myKeyFile = "/tmp/Creds/key.pem"

let mySSLConfig =  SSLConfig(withCACertificateDirectory: nil,
                             usingCertificateFile: myCertFile,
                             withKeyFile: myKeyFile,
                             usingSelfSignedCerts: false)
#else // on macOS

let myCertKeyFile = "/Users/administrator/Documents/Application/SSL/www.universedocs.com.pfx"
//let myCertKeyFile = "/tmp/cred/www.universedocs.com.pfx"

let ssl =  SSLConfig(withChainFilePath: myCertKeyFile,
                     withPassword: "Paradu93*",
                     usingSelfSignedCerts: false)

#endif

let router = Router()

router.add(templateEngine: StencilTemplateEngine())
router.all(middleware: StaticFileServer())

router.get("/") { request, response, next in
    let model: [String: [[String:Any]]] = ["" :[]]

    do {
        try response.render("home.stencil", context: model)
//        try! response.redirect("https:/universedocs.com:81/")
    } catch let error {
        print(error)
        response.send(json: ["Error": error.localizedDescription])
    }
    next()
}
//Kitura.addHTTPServer(onPort: 81, with: router)
Kitura.addHTTPServer(onPort: 81, with: router, withSSL: ssl)
Kitura.run()
