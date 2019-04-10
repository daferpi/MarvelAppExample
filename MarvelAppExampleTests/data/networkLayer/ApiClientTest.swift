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

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        let apiClient = createApiClientWithApiParams(apiParams: ApiParams.createDefaultParamsWithHashGenerator(hashGenerator: ApiHashGenerator(timeStamp: 1)))
        
        let expectation = self.expectation(description: "creation")
        apiClient.request(.charactersList) { moyaResult in
            print(try! moyaResult.get().request?.url?.absoluteString)
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)

        
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
