//
// Created by abelFernandez on 28/09/2018.
// Copyright (c) 2018 abelFernandez. All rights reserved.
//

import Foundation

struct CharacterDataContainer: Codable, Hashable, Equatable {
    let offset:Int?
    let limit:Int?
    let total:Int?
    let count:Int?
    let results:[MarvelCharacter]?

    var hashValue: Int {
        var result = offset?.hashValue ?? 0
        result = result &* 31 &+ (limit?.hashValue ?? 0)
        result = result &* 31 &+ (total?.hashValue ?? 0)
        result = result &* 31 &+ (count?.hashValue ?? 0)
        return result
    }

    static func ==(lhs: CharacterDataContainer, rhs: CharacterDataContainer) -> Bool {
        if lhs.offset != rhs.offset {
            return false
        }
        if lhs.limit != rhs.limit {
            return false
        }
        if lhs.total != rhs.total {
            return false
        }
        if lhs.count != rhs.count {
            return false
        }
        return true
    }
}
