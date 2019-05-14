//
// Created by abelFernandez on 26/09/2018.
// Copyright (c) 2018 abelFernandez. All rights reserved.
//

import Foundation
import Moya

enum ApiClient {
    case charactersList
    case characterDetail(characterId:String)
    case comicsList
    case comicDetails(comicId:String)
}

extension ApiClient: TargetType {
    

    public var baseURL: URL {
        return URL(string: NetworkConstants.BASE_URL)!
    }

    public var path: String {
        switch self {
        case .charactersList:
            return NetworkConstants.ApiPath.CHARACTERS_LIST
        case .characterDetail(let characterId):
            return NetworkConstants.ApiPath.CHARACTERS_DETAIL + characterId
        case .comicsList:
            return NetworkConstants.ApiPath.COMICS_LIST
        case .comicDetails(let comicId):
            return NetworkConstants.ApiPath.COMICS_DETAIL + comicId
        }
    }

    public var method: Moya.Method {
        return .get
    }

    public var sampleData: Data {
        switch self {
        case .charactersList:
            let stubbed = stubbedResponse("marvelResponse")
            return stubbed!
        case .characterDetail(_):
            return "".utf8Encoded
        case .comicsList:
            return "".utf8Encoded
        case .comicDetails(_):
            return "".utf8Encoded
        }
    }
    
   public var task: Task {
        return .requestPlain
    }
    

    public var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }

}

// MARK: - Helpers
private extension String {
    var urlEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }

    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
}

private extension ApiClient {
    
    func stubbedResponse(_ fileName: String) -> Data! {
        @objc class TestClass: NSObject {}
        
        let bundle = Bundle(for: TestClass.self)
        let path = bundle.path(forResource: fileName, ofType: "json")
        return try? Data(contentsOf: URL(fileURLWithPath: path!))
    }
}

struct ApiClientFactory {
    static func createApiClientWithApiParams(apiParams params: ApiParams) -> MoyaProvider<ApiClient> {
        let endpointClosure = createEndpoint(apiParams: params)
        return MoyaProvider(endpointClosure: endpointClosure)
    }

    static func createStubApiClientWithApiParams(apiParams params: ApiParams) -> MoyaProvider<ApiClient> {
        let endpointClosure = createEndpoint(apiParams: params)
        return MoyaProvider(endpointClosure: endpointClosure, stubClosure: MoyaProvider.immediatelyStub, plugins: [NetworkLoggerPlugin(verbose: true)])
    }

    static private func createEndpoint(apiParams params: ApiParams) -> (ApiClient) -> Endpoint {
        let endpointClosure = { (target: ApiClient) -> Endpoint in
            let task = Task.requestParameters(parameters: params.loadParams(), encoding: URLEncoding.queryString)
            let defaultEndpoint = MoyaProvider.defaultEndpointMapping(for: target)
            return defaultEndpoint.replacing(task: task)
        }
        return endpointClosure
    }
}
