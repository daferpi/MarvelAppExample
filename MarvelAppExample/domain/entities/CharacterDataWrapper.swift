//
// Created by abelFernandez on 28/09/2018.
// Copyright (c) 2018 abelFernandez. All rights reserved.
//

import Foundation

struct CharacterDataWrapper: Codable {
    let code:Int?
    let status:String?
    let copyright:String?
    let attributionText:String?
    let attributionHTML:String?
    let data:CharacterDataContainer?
    let etag:String?
}
