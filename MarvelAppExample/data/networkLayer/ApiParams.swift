//
// Created by abelFernandez on 2019-04-07.
// Copyright (c) 2019 abelFernandez. All rights reserved.
//

import Foundation

class ApiParams {

    private var params = [String:String]()
    
    func addParam(paramName:String, paramValue: String) {
        self.params[paramName] = paramValue
    }
    
    func loadParams() -> [String:String] {
        return params
    }

}

extension ApiParams {
    
    static func createDefaultParamsWithHashGenerator(hashGenerator: ApiHashGenerator) -> ApiParams {

        let apiParams = ApiParams()
        apiParams.addParam(paramName: NetworkConstants.ApiParamNames.TIMESTAMP, paramValue: String(hashGenerator.timeStamp))
        apiParams.addParam(paramName: NetworkConstants.ApiParamNames.API_KEY, paramValue: String(hashGenerator.publicKey))
        apiParams.addParam(paramName: NetworkConstants.ApiParamNames.HASH, paramValue: String(hashGenerator.generateHash()))

        return apiParams
    }
}