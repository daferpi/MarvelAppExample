//
// Created by abelFernandez on 2019-04-06.
// Copyright (c) 2019 abelFernandez. All rights reserved.
//

import Foundation
import CryptoSwift

struct ApiHashGenerator {

    let timeStamp: Int
    let privateKey: String
    let publicKey: String

    func generateHash() -> String {
        return "\(timeStamp)\(privateKey)\(publicKey)".md5()
    }
}
