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
