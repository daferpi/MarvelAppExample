//
//  ApiHashGeneratorTest.swift
//  MarvelAppExample
//
//  Created by abelFernandez on 2019-04-06.
//  Copyright © 2019 abelFernandez. All rights reserved.
//

import XCTest
import CryptoSwift
@testable import MarvelAppExample

class ApiHashGeneratorTest: XCTestCase {


    func testShouldGenerateAValidHasMD5hWhenGenerateMethodIsCalled() {

        let timeStamp = 1
        let privateKey = "1234"
        let publicKey = "5678"

        let apiHashGenerator = ApiHashGenerator(timeStamp: timeStamp, privateKey: privateKey, publicKey: publicKey)

        let expectedHash = "\(timeStamp)\(privateKey)\(publicKey)".md5()
        let generatedHash = apiHashGenerator.generateHash()

        XCTAssertEqual(expectedHash, generatedHash)
    }

    func testShouldGenerateAValidHasMD5hWhenGenerateMethodIsCalledWithDefaultParams() {

        let timeStamp = 1

        let apiHashGenerator = ApiHashGenerator(timeStamp: timeStamp)

        let expectedHash = "\(timeStamp)\(Secrets.privateKey)\(Secrets.publicKey)".md5()
        let generatedHash = apiHashGenerator.generateHash()

        XCTAssertEqual(expectedHash, generatedHash)
    }



}
