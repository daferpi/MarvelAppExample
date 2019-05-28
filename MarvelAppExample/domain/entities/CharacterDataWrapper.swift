//
// Created by abelFernandez on 28/09/2018.
// Copyright (c) 2018 abelFernandez. All rights reserved.
//

import Foundation

struct CharacterDataWrapper: Codable, Hashable, Equatable {
    let code:Int?
    let status:String?
    let copyright:String?
    let attributionText:String?
    let attributionHTML:String?
    let data:CharacterDataContainer?
    let etag:String?

    var hashValue: Int {
        var result = code?.hashValue ?? 0
        result = result &* 31 &+ (status?.hashValue ?? 0)
        result = result &* 31 &+ (copyright?.hashValue ?? 0)
        result = result &* 31 &+ (attributionText?.hashValue ?? 0)
        result = result &* 31 &+ (attributionHTML?.hashValue ?? 0)
        result = result &* 31 &+ (etag?.hashValue ?? 0)
        return result
    }

    static func ==(lhs: CharacterDataWrapper, rhs: CharacterDataWrapper) -> Bool {
        if lhs.code != rhs.code {
            return false
        }
        if lhs.status != rhs.status {
            return false
        }
        if lhs.copyright != rhs.copyright {
            return false
        }
        if lhs.attributionText != rhs.attributionText {
            return false
        }
        if lhs.attributionHTML != rhs.attributionHTML {
            return false
        }
        if lhs.etag != rhs.etag {
            return false
        }
        return true
    }
}
