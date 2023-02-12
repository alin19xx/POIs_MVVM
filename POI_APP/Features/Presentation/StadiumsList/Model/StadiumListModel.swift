//
//  StadiumListModel.swift
//  POI_APP
//
//  Created by Alex Lin on 8/2/23.
//

import Foundation

struct StadiumListModel {
    var stadiums: [StadiumModel]
    
    init(entity: StadiumsEntity) {
        var listAux = [StadiumModel]()
        
        entity.stadiums.forEach { stadiumEntity in
            listAux.append(StadiumModel(entity: stadiumEntity))
        }
        
        self.stadiums = listAux
    }
    
    init(models: [StadiumModel]) {
        var listAux = [StadiumModel]()
        
        models.forEach { model in
            listAux.append(model)
        }
        
        self.stadiums = listAux
    }
}

struct StadiumModel {
    var id: String
    var title: String
    var lat: String
    var long: String
    var image: String
    
    init(entity: StadiumEntity) {
        self.id = entity.id
        self.title = entity.title
        self.lat = entity.lat
        self.long = entity.long
        self.image = entity.image
    }
}
