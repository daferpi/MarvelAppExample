//
// Created by abelFernandez on 28/09/2018.
// Copyright (c) 2018 abelFernandez. All rights reserved.
//

import Foundation

struct SeriesList: Codable {

    let available:Int?
    let returned:Int?
    let collectionURI:String?
    let items:[SeriesSummary]?
}
