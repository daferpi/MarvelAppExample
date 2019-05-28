//
// Created by abelFernandez on 22/09/2018.
// Copyright (c) 2018 abelFernandez. All rights reserved.
//

import Foundation
import RxSwift


protocol ListCharacterViewModel {
    func fetchCharacterData() -> Observable<CharacterDataWrapper>?
}

struct ListCharacterViewModelRemoteApi: ListCharacterViewModel {

    let repository: CharactersRepository

    init(repository: CharactersRepository = CharacterRepositoryRemoteApi()) {
        self.repository = repository
    }

    func fetchCharacterData() -> Observable<CharacterDataWrapper>? {
        return self.repository.loadCharacterContainer()
    }
}
