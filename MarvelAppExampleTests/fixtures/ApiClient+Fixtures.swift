//
// Created by abelFernandez on 2019-05-14.
// Copyright (c) 2019 abelFernandez. All rights reserved.
//

import Foundation
import Moya
@testable import MarvelAppExample

extension ApiClient {

    func decodeJSON<T>(_ type: T.Type,  fileName: String) throws -> T where T : Decodable {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        let data = ApiClient.stubbedResponse(fileName)
        return try decoder.decode(type, from: data!)
    }
}

extension ApiClientFactory {
    public typealias SampleResponseClosure = () -> EndpointSampleResponse

    static func createDefaultStubApiClient() -> MoyaProvider<ApiClient> {
        return createStubApiClientWithApiParams(apiParams: defaultParams(), responseClosure: { .networkResponse(200, ApiClient.stubbedResponse("marvelResponse")) })
    }

    static func createStubApiClientWithDefaultParams(responseClosure sampleResponseClosure: @escaping SampleResponseClosure) -> MoyaProvider<ApiClient> {
        return createStubApiClientWithApiParams(apiParams: defaultParams(), responseClosure: sampleResponseClosure)
    }

    private static func createStubApiClientWithApiParams(apiParams params: ApiParams, responseClosure sampleResponseClosure: @escaping SampleResponseClosure) -> MoyaProvider<ApiClient> {
        let endpointClosure = { (target: ApiClient) -> Endpoint in
            let task = Task.requestParameters(parameters: params.loadParams(), encoding: URLEncoding.queryString)
            let defaultEndpoint = createEndpoint(for: target, with: sampleResponseClosure)
            return defaultEndpoint.replacing(task: task)
        }
        return MoyaProvider(endpointClosure: endpointClosure, stubClosure: MoyaProvider.immediatelyStub, plugins: [NetworkLoggerPlugin(verbose: true)])
    }

    private static func defaultParams() -> ApiParams {
        return ApiParams.createDefaultParamsWithHashGenerator(hashGenerator: ApiHashGenerator(timeStamp: 1))
    }

    private static func createEndpoint(for target: ApiClient, with sampleResponseClosure: @escaping SampleResponseClosure ) -> Endpoint {
        return Endpoint(
                url: URL(target: target).absoluteString,
                sampleResponseClosure:sampleResponseClosure,
                method: target.method,
                task: target.task,
                httpHeaderFields: target.headers
        )

    }

}