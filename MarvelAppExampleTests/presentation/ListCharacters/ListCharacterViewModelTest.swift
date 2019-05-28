//
//  ListCharacterViewModelTest.swift
//  MarvelAppExample
//
//  Created by abelFernandez on 2019-05-17.
//  Copyright © 2019 abelFernandez. All rights reserved.
//

import XCTest
import RxSwift
import Moya
import RxBlocking
@testable import MarvelAppExample

class ListCharacterViewModelTest: XCTestCase {


    let viewModel: ListCharacterViewModel = ListCharacterViewModelRemoteApi(repository: CharactersRepositoryMock())

    func testWhenFetchCharacterDataReturnObservableCharacterDataWrapper() throws {

        let characterExpected = MarvelCharacter(id:1, name:"name 1", description:"description 1",
                modified:"26/10/2015", resourceURI:"http://example1.com", urls:nil, thumbnail:MarvelImage(path:"path", imgExtension:"png"),
                comics:nil, stories:nil, events:nil, series:nil)

        // When
        let dataWrapper = try! viewModel.fetchCharacterData()!.toBlocking().first()

        // Then
        XCTAssertEqual(5, dataWrapper?.data?.results?.count)
        XCTAssertEqual("200", dataWrapper?.status)
        XCTAssertEqual(characterExpected, dataWrapper!.data!.results![0])


    }


}


enum MockupResponsesType {
    case success
    case error
}

struct CharactersRepositoryMock: CharactersRepository {

    private let responseType: MockupResponsesType

    init(responseType: MockupResponsesType = .success) {
        self.responseType = responseType
    }

    func loadCharacterContainer() -> Observable<CharacterDataWrapper>? {
        switch self.responseType {
        case .success:
            return Observable.just(CharacterDataWrapper.makeFullCharacterDataWapper())
        case .error:
            return Observable.error(MoyaError.requestMapping("Error"))
        }
    }

}

private extension CharacterDataWrapper {
    static func makeFullCharacterDataWapper() -> CharacterDataWrapper {
        return CharacterDataWrapper(code: 1, status: "200", copyright: "CopyRight",
                attributionText: "attributionText", attributionHTML: "attributionHTML",
                data: CharacterDataContainer.makeFullCharacterDataContainer(), etag: "etag")
    }
}

private extension CharacterDataContainer {
    static func makeFullCharacterDataContainer() -> CharacterDataContainer {
        return CharacterDataContainer(offset: 0, limit: 5, total: 5,
                count: 5, results: createCharacterList(numberOfElements: 5))
    }

    private static func createCharacterList(numberOfElements:Int) -> [MarvelCharacter] {
        var characterList: [MarvelCharacter] = [MarvelCharacter]()
        for index in 1...numberOfElements {
            let character = MarvelCharacter(id:index, name:"name \(index)", description:"description \(index)",
                modified:"26/10/2015", resourceURI:"http://example\(index).com", urls:nil, thumbnail:MarvelImage(path:"path", imgExtension:"png"),
            comics:nil, stories:nil, events:nil, series:nil)
            characterList.append(character)
        }
        return characterList
    }
}

