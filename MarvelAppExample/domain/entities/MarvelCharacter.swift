//
// Created by abelFernandez on 28/09/2018.
// Copyright (c) 2018 abelFernandez. All rights reserved.
//

import Foundation

struct MarvelCharacter: Codable, Hashable, Equatable {
    let id:Int?
    let name:String?
    let description:String?
    let modified:String?
    let resourceURI:String?
    let urls:[Url]?
    let thumbnail:MarvelImage?
    let comics:ComicList?
    let stories:StoryList?
    let events:EventList?
    let series:SeriesList?

    var hashValue: Int {
        var result = id?.hashValue ?? 0
        result = result &* 31 &+ (name?.hashValue ?? 0)
        result = result &* 31 &+ (description?.hashValue ?? 0)
        result = result &* 31 &+ (modified?.hashValue ?? 0)
        result = result &* 31 &+ (resourceURI?.hashValue ?? 0)
        return result
    }

    static func ==(lhs: MarvelCharacter, rhs: MarvelCharacter) -> Bool {
        if lhs.id != rhs.id {
            return false
        }
        if lhs.name != rhs.name {
            return false
        }
        if lhs.description != rhs.description {
            return false
        }
        if lhs.modified != rhs.modified {
            return false
        }
        if lhs.resourceURI != rhs.resourceURI {
            return false
        }
        return true
    }
}
