//
//  ApiParamsTest.swift
//  MarvelAppExample
//
//  Created by abelFernandez on 2019-04-07.
//  Copyright © 2019 abelFernandez. All rights reserved.
//

import XCTest
@testable import MarvelAppExample

class ApiParamsTest: XCTestCase {

    var apiParams: ApiParams = ApiParams()

    func testShouldContainsTheParamWhenAddParamIsCalled() {

        let paramName = "paramName"
        let paramValue = "paramValue"

        apiParams.addParam(paramName:paramName, paramValue: paramValue)

        let params = apiParams.loadParams()

        XCTAssertEqual(paramValue, params[paramName])
    }

    func testShouldBeEmptyWhenAddParamIsNotCalled() {

        let params = apiParams.loadParams()

        XCTAssertTrue(params.isEmpty)
    }

    func testShouldReturnDefaultApiParamsWhenCallCreateWithDefaultParams() {

//        let timeStamp = 1
//
//        let apiParams = ApiParams.createDefaultParamsWithTimestam(timeStamp:timeStamp)
//
//        let params = apiParams.loadParams()
//
//        XCTAssertEqual(timeStamp, params[NetworkConstants.ApiParamNames.TIMESTAMP])
//        XCTAssertEqual(Secrets.publicKey, params[NetworkConstants.ApiParamNames.API_KEY])
//        XCTAssertEqual(timeStamp, params[NetworkConstants.ApiParamNames.HASH])
    }


}
