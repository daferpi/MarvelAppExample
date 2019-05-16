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
import Moya
@testable import MarvelAppExample

class CharactersRepositoryTest: XCTestCase {

    var repository: CharactersRepository = CharacterRepositoryRemoteApi(apiClient: ApiClientFactory.createDefaultStubApiClient())

    func testShouldReturnCharacterDataWhenLoadCharacters() throws {

        // When
        let characterContainer: CharacterDataWrapper? = try repository.loadCharacterContainer()?.toBlocking().first()

        // Then
        XCTAssertNotNil(characterContainer)
        XCTAssertNotNil(characterContainer?.data)
        XCTAssertEqual(20,characterContainer?.data?.results?.count)

    }

    func testShouldReturnErrorWhenApiClientReturnErrorCode() throws {
        // Given
        let apiClient = ApiClientFactory.createStubApiClientWithDefaultParams(responseClosure: { .networkResponse(500, "Server Error".data(using: .utf8)!) })
        repository = CharacterRepositoryRemoteApi(apiClient: apiClient)

        // When

        let result = repository.loadCharacterContainer()!.toBlocking().materialize()


        // Then
        var characterError: MoyaError!
        switch result {
        case .completed:
            XCTFail()
        case .failed(_, error: let error):
            characterError = error as? MoyaError
        }
        XCTAssertNotNil(characterError)
        XCTAssertEqual(500, characterError.response?.statusCode)

    }

    func testShouldReturnErrorWhenApiClientNetworkFails() throws {
        // Given
        let error = NSError(domain: "test", code: 999)
        let apiClient = ApiClientFactory.createStubApiClientWithDefaultParams(responseClosure: { .networkError(error) })
        repository = CharacterRepositoryRemoteApi(apiClient: apiClient)

        // When

        let result = repository.loadCharacterContainer()!.toBlocking().materialize()


        // Then
        var characterError: NSError!
        switch result {
        case .completed:
            XCTFail()
        case .failed(_, error: let error):
            characterError = error as NSError
        }
        XCTAssertNotNil(characterError)
        XCTAssertEqual("The operation couldn’t be completed. (test error 999.)", characterError.localizedDescription)

    }





}
