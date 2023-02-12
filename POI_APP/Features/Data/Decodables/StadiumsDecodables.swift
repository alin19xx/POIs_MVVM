//
//  StadiumsDecodables.swift
//  POI_APP
//
//  Created by Alex Lin on 8/2/23.
//

import Foundation

struct StadiumsDecodable: Codable {
    var list: [StadiumDecodable]?
}

struct StadiumDecodable: Codable {
    var id: String?
    var title: String?
    var geocoordinates: String?
    var image: String?
}
