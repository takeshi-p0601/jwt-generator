import SwiftJWT
import Foundation

struct MyClams: Claims {
    let iss: String
    let sub: String
    let exp: Date
    let iat: Date
    let aud: String
}

let myHeader = Header(typ: "JWT", kid: "XXXXXXXXX")
let myClams = MyClams(iss: "XXXXXXXXX@tXXXXXXXXX.com",
                      sub: "XXXXXXXXX@XXXXXXXXX.com",
                      exp: Date(timeIntervalSinceNow: 3600),
                      iat: Date(),
                      aud: "https://XXXXXXXXX.XXXXXXXXX.com/")

let privateKeyStr = """
-----BEGIN PRIVATE KEY-----\nXXXXXXXXX\n-----END PRIVATE KEY-----\n
"""

let privateKey: Data = privateKeyStr.data(using: .utf8)!
var myJWT = JWT(header: myHeader, claims: myClams)
var signed = try myJWT.sign(using: JWTSigner.rs256(privateKey: privateKey))

print("@@@ :: \(signed)")
