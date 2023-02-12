//
//  StadiumsRepositorySuccessMock.swift
//  POI_APPTests
//
//  Created by Alex Lin on 7/2/23.
//

import XCTest
@testable import POI_APP

extension StadiumsCaseTest {
    class StadiumsRepositorySuccessMock: StadiumsRepository {
        func fetchStadiums(completion: @escaping (Result<StadiumsDecodable, Error>) -> Void) {
            let json = StadiumsSuccessMock.jsonMock()
            let decoder = JSONDecoder()
            
            do {
                let stadiums = try decoder.decode(StadiumsDecodable.self, from: json)
                completion(.success(stadiums))
            } catch {
                let error = NSError(domain: "Can't be parsed", code: 1)
                completion(.failure(error))
            }
        }
    }
}
