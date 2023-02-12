//
//  StadiumsEntity.swift
//  POI_APP
//
//  Created by Alex Lin on 8/2/23.
//

import Foundation

struct StadiumsEntity {
    var stadiums: [StadiumEntity]
    
    init?(decodable: StadiumsDecodable) {
        guard let stadiums = decodable.list else { return nil }
        var listAux = [StadiumEntity]()
        
        stadiums.forEach { decodable in
            guard let entity = StadiumEntity(decodable: decodable) else { return }
            listAux.append(entity)
        }
        
        self.stadiums = listAux
    }
}

struct StadiumEntity {
    var id: String
    var title: String
    var lat: String
    var long: String
    var image: String
    
    init?(decodable: StadiumDecodable) {
        guard let id = decodable.id,
              let title = decodable.title,
              let geocoordinates = decodable.geocoordinates,
              let image = decodable.image,
              let indexSeparator = geocoordinates.lastIndexOfCharacter(Character(","))else { return nil }
        
        self.id = id
        self.title = title
        self.image = image
        self.lat = geocoordinates.substring(to: indexSeparator)
        self.long = geocoordinates.substring(from: indexSeparator)
    }
}
