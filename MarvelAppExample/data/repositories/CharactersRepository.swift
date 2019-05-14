//
// Created by abelFernandez on 22/09/2018.
// Copyright (c) 2018 abelFernandez. All rights reserved.
//

import Foundation
import RxSwift
import Moya

protocol CharactersRepository {

    func loadCharacterContainer() -> Observable<CharacterDataWrapper>?
}

final class CharacterRepositoryRemoteApi: CharactersRepository {

    private let apiClient: MoyaProvider<ApiClient>

    init(apiClient: MoyaProvider<ApiClient> = ApiClientFactory.createApiClientWithApiParams(apiParams: ApiParams.createDefaultParamsWithHashGenerator(hashGenerator: ApiHashGenerator(timeStamp: Int(Date().timeIntervalSinceReferenceDate))))) {
        self.apiClient = apiClient
    }

    func loadCharacterContainer() ->  Observable<CharacterDataWrapper>? {
        return self.apiClient.rx.request(.charactersList)
                .asObservable()
                .filterSuccessfulStatusCodes()
                .map(CharacterDataWrapper.self)
                .asObservable()
    }
}