//
// Created by abelFernandez on 22/09/2018.
// Copyright (c) 2018 abelFernandez. All rights reserved.
//

import Foundation

protocol CharactersRepository {
    
    func loadCharacterContainer() -> CharacterDataContainer?
}

final class CharacterRepositoryRemoteApi: CharactersRepository {

    func loadCharacterContainer() -> CharacterDataContainer? {
        fatalError("loadCharacterContainer() has not been implemented")
    }
}