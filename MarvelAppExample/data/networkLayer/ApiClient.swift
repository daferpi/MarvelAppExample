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

//extension ApiClient:TargetType {
//
//}
