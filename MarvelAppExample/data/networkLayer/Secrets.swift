//
//  Secrets.swift
//  MarvelAppExample
//
//  Created by abelFernandez on 06/04/2019.
//  Copyright © 2019 abelFernandez. All rights reserved.
//

import Keys

struct Secrets {
    private static let keys = MarvelAppExampleKeys()
    
    static var publicKey: String {
        return keys.publicApiKey
    }
    
    static var privateKey: String {
        return keys.privateApiKey
    }
    
}
