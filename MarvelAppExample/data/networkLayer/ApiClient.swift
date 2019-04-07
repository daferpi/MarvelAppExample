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

extension ApiClient:TargetType {   

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
            return "".utf8Encoded
        case .characterDetail(_):
            return "".utf8Encoded
        case .comicsList:
            return "".utf8Encoded
        case .comicDetails(_):
            return "".utf8Encoded
        }
    }

    public var task: Task {
        return .requestParameters(parameters:defaultParams, encoding: URLEncoding.default)
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
    var defaultParams: [String: String] {
        return ApiParams.createDefaultParamsWithHashGenerator(hashGenerator: ApiHashGenerator(timeStamp: Int(Date().timeIntervalSince1970)))
    }
}