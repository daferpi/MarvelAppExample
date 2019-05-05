//
//  ApiClientTest.swift
//  MarvelAppExampleTests
//
//  Created by abelFernandez on 08/04/2019.
//  Copyright © 2019 abelFernandez. All rights reserved.
//

import XCTest
import Moya
@testable import MarvelAppExample

class ApiClientTest: XCTestCase {
    

    func testWhenCharacterListIsCalledReturnData() {
        let fullCharacterListUrl = "https://gateway.marvel.com/v1/public/characters?apikey=afed67d085831e707f8dc7ab639b641c&hash=06a76e669879f5475524539efb629746&ts=1"
        
        let apiClient = createApiClientWithApiParams(apiParams: ApiParams.createDefaultParamsWithHashGenerator(hashGenerator: ApiHashGenerator(timeStamp: 1)))
        
        let expectation = self.expectation(description: "creation")
        
        var absouluteUrl: String!
        var data: Data!
        apiClient.request(.charactersList) { moyaResult in
            absouluteUrl = try! moyaResult.get().request!.url!.absoluteString
            data = moyaResult.result.value!.data
            
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
        
        XCTAssertEqual(fullCharacterListUrl, absouluteUrl)
        XCTAssertNotNil(data)

        
    }
    
    private func createApiClientWithApiParams(apiParams params: ApiParams) -> MoyaProvider<ApiClient> {
        
        let endpointClosure = { (target: ApiClient) -> Endpoint in
            let task = Task.requestParameters(parameters: params.loadParams(), encoding: URLEncoding.queryString)
            let defaultEndpoint = MoyaProvider.defaultEndpointMapping(for: target)
            return defaultEndpoint.replacing(task: task)
        }
        
        return MoyaProvider(endpointClosure: endpointClosure, stubClosure: MoyaProvider.immediatelyStub, plugins: [NetworkLoggerPlugin(verbose: true)])
    }

}
