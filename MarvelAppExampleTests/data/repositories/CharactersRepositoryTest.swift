//
//  CharactersRepositoryTest.swift
//  MarvelAppExample
//
//  Created by abelFernandez on 2019-05-05.
//  Copyright © 2019 abelFernandez. All rights reserved.
//

import XCTest
import RxSwift
import RxBlocking
@testable import MarvelAppExample

class CharactersRepositoryTest: XCTestCase {

    let repository: CharactersRepository = CharacterRepositoryRemoteApi(apiClient: ApiClientFactory.createStubApiClientWithApiParams(apiParams: ApiParams.createDefaultParamsWithHashGenerator(hashGenerator: ApiHashGenerator(timeStamp: 1))))

    func testShouldReturnCharacterContainerObservableWhenLoadCharacters() throws {

        // When
        let characterContainer: CharacterDataContainer? = try repository.loadCharacterContainer()?.toBlocking().first()

        // Then
        XCTAssertNotNil(characterContainer)
        XCTAssertNotNil(characterContainer?.results)
        XCTAssertEqual(20,characterContainer?.results!.count)

    }



}
