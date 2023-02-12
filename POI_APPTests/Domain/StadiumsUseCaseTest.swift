//
//  StadiumsUseCaseTest.swift
//  POI_APPTests
//
//  Created by Alex Lin on 7/2/23.
//

import XCTest
@testable import POI_APP


// MARK: ERRORS
extension StadiumsCaseTest {
    enum StadiumsListMock: Error {
        case decodableError
    }
}

class StadiumsCaseTest: XCTestCase {
    
    func testFetchStadiums_whenSuccessfully() {
        let expt = self.expectation(description: "\(#function)")
        
        let repository = StadiumsRepositorySuccessMock()
        let useCase = DefaultStadiumsUseCase(repository: repository)
        
        useCase.fetchStadiums { result in
            switch result {
            case .success(let entity):
                XCTAssertEqual(entity.stadiums.first?.id, "1")
                XCTAssertEqual(entity.stadiums.first?.title, "Camp Nou")
                XCTAssertEqual(entity.stadiums.first?.lat, "41.3809")
                XCTAssertEqual(entity.stadiums.first?.long, "2.1206311")
                XCTAssertEqual(entity.stadiums.first?.image, "https://upload.wikimedia.org/wikipedia/commons/thumb/f/fc/Camp_Nou_aerial_%28cropped%29.jpg/150px-Camp_Nou_aerial_%28cropped%29.jpg")
            case .failure(let error):
                XCTAssertNil(error)
            }
            expt.fulfill()
        }
        
        wait(for: [expt], timeout: 3)
    }
}



