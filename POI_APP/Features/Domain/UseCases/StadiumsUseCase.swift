//
//  StadiumsUseCase.swift
//  POI_APP
//
//  Created by Alex Lin on 8/2/23.
//

import Foundation

protocol StadiumsUseCase {
    func fetchStadiums(completion: @escaping (Result<StadiumsEntity, Error>) -> Void)
}

final class DefaultStadiumsUseCase: StadiumsUseCase {
    
    private enum Constants {
        static let stadiumsKey: NSString = "STADIUMS_CACHE"
    }
    
    private let repository: StadiumsRepository
    private let cache = NSCache<NSString, StructWrapper<StadiumsEntity>>()
    
    init(repository: StadiumsRepository = DefaultStadiumsRepository()) {
        self.repository = repository
    }
    
    func fetchStadiums(completion: @escaping (Result<StadiumsEntity, Error>) -> Void) {
        if let cachedStadiums = useStadiumListFromCache() {
            completion(.success(cachedStadiums))
        } else {
            repository.fetchStadiums { result in
                switch result {
                case .success(let decodable):
                    if let stadiums = StadiumsEntity(decodable: decodable) {
                        self.saveStadiumListOnCache(stadiums: stadiums)
                        completion(.success(stadiums))
                    }
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    }
}

class StructWrapper<T>: NSObject {
    
    let value: T
    
    init(_ _struct: T) {
        self.value = _struct
    }
}

extension DefaultStadiumsUseCase {
    private func useStadiumListFromCache() -> StadiumsEntity? {
        guard let cachedStadiums = cache.object(forKey: Constants.stadiumsKey) else { return nil }
        
        debugPrint("INFO: Using data retrived from cache")
        return cachedStadiums.value
    }
    
    private func saveStadiumListOnCache(stadiums: StadiumsEntity) {
        var stadiumListToCache = StructWrapper<StadiumsEntity>(stadiums)
        
        self.cache.setObject(stadiumListToCache, forKey: Constants.stadiumsKey)
        debugPrint("INFO: Cached data")
    }
}
