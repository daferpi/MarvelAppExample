//
// Created by abelFernandez on 28/09/2018.
// Copyright (c) 2018 abelFernandez. All rights reserved.
//

import Foundation

struct Character {
    let id:Int?
    let name:String?
    let description:String?
    let modified:String?
    let resourceURI:String?
    let urls:[Url]?
    let thumbnail:[Image]?
    let comics:ComicList?
    let stories:StoryList?
    let events:EventList?
    let series:SeriesList?
}
