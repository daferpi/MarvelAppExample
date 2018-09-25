//
//  NetworkConstants.swift
//  MarvelAppExample
//
//  Created by abelFernandez on 25/09/2018.
//  Copyright © 2018 abelFernandez. All rights reserved.
//

import Foundation

struct NetworkConstants {
    static let API_KEY = "afed67d085831e707f8dc7ab639b641c"
    static let BASE_URL = "https://gateway.marvel.com/"
    
    struct ApiPath {
        static let CHARACTERS_LIST = "/v1/public/characters"
        static let CHARACTERS_DETAIL = "/v1/public/characters/{characterId}"
        static let COMICS_LIST = "/v1/public/comics"
        static let COMICS_DETAIL = "/v1/public/comics/{comicId}"
    }
}
