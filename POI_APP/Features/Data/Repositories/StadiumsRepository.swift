//
//  StadiumsRepository.swift
//  POI_APP
//
//  Created by Alex Lin on 8/2/23.
//

import Foundation

protocol StadiumsRepository {
    func fetchStadiums(completion: @escaping (Result<StadiumsDecodable, Error>) -> Void)
}

final class DefaultStadiumsRepository: StadiumsRepository {
    
    private enum Constants {
        static let stadiumsURL = "https://sergiocasero.es/pois.json"
    }
    
    init() {}
    
    func fetchStadiums(completion: @escaping (Result<StadiumsDecodable, Error>) -> Void) {
        
        guard let url = URL(string: Constants.stadiumsURL) else {
            completion(.failure(NSError()))
            return
        }

        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else {
                completion(.failure(NSError()))
                return
            }
            
            
            do {
                let stadiums = try JSONDecoder().decode(StadiumsDecodable.self, from: data)
                completion(.success(stadiums))
            } catch {
                let error = NSError(domain: "Can't be parsed", code: 1)
                completion(.failure(error))
            }
        }

        task.resume()
    }
}
