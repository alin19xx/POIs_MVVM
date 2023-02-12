//
//  StadiumsSuccessMock.swift
//  POI_APPTests
//
//  Created by Alex Lin on 7/2/23.
//

import XCTest

class StadiumsSuccessMock: XCTestCase {
    static func jsonMock() -> Data {
        return Data("""
{
    "list": [
        {
            "id": "1",
            "title": "Camp Nou",
            "geocoordinates": "41.3809,2.1206311",
            "image": "https://upload.wikimedia.org/wikipedia/commons/thumb/f/fc/Camp_Nou_aerial_%28cropped%29.jpg/150px-Camp_Nou_aerial_%28cropped%29.jpg"
        },
        {
            "id": "2",
            "title": "Santiago Bernabéu",
            "geocoordinates": "40.4530428,-3.6905224",
            "image": "https://upload.wikimedia.org/wikipedia/commons/thumb/8/8e/City_of_Madrid_%2818036089422%29.jpg/150px-City_of_Madrid_%2818036089422%29.jpg"
        },
        {
            "id": "3",
            "title": "Estadio Metropolitano",
            "geocoordinates": "40.4531069,-3.723353",
            "image": "https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Wanda-Metropolitano.jpg/150px-Wanda-Metropolitano.jpg"
        },
        {
            "id": "4",
            "title": "Benito Villamarín",
            "geocoordinates": "37.3565079,-5.9839408",
            "image": "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b2/Estadio_Benito_Villamar%C3%ADn_2018003.jpg/150px-Estadio_Benito_Villamar%C3%ADn_2018003.jpg"
        },
        {
            "id": "5",
            "title": "La Cartuja",
            "geocoordinates": "37.3986272,-6.0159768",
            "image": "https://upload.wikimedia.org/wikipedia/commons/thumb/7/7b/Panoramio_-_V%26A_Dudush_-_Estadio_Ol%C3%ADmpico_57_619.jpg/150px-Panoramio_-_V%26A_Dudush_-_Estadio_Ol%C3%ADmpico_57_619.jpg"
        },
        {
            "id": "6",
            "title": "Olímpico Lluís Companys",
            "geocoordinates": "41.3647521,2.1534817",
            "image": "https://upload.wikimedia.org/wikipedia/commons/thumb/3/39/Estadi.JPG/150px-Estadi.JPG"
        },
        {
            "id": "7",
            "title": "Mestalla",
            "geocoordinates": "39.4700816,-0.3640743",
            "image": "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e4/Mestalla_trofeu_taronja_120811.jpg/150px-Mestalla_trofeu_taronja_120811.jpg"
        },
        {
            "id": "8",
            "title": "San Mamés",
            "geocoordinates": "40.9919731,-3.7098967",
            "image": "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f8/San_Mames%2C_Bilbao%2C_Euskal_Herria_-_Basque_Country.jpg/150px-San_Mames%2C_Bilbao%2C_Euskal_Herria_-_Basque_Country.jpg"
        },
        {
            "id": "9",
            "title": "Ramón Sánchez-Pizjuán",
            "geocoordinates": "37.3840697,-5.9728789",
            "image": "https://upload.wikimedia.org/wikipedia/commons/thumb/1/17/Sevilla2-1Lega20182.jpg/150px-Sevilla2-1Lega20182.jpg"
        },
        {
            "id": "10",
            "title": "RCDE Stadium",
            "geocoordinates": "41.3479775,2.0725766",
            "image": "https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/EstadioRCDE_Pano.jpg/150px-EstadioRCDE_Pano.jpg"
        },
        {
            "id": "11",
            "title": "Reale Arena",
            "geocoordinates": "43.3014057,-1.9757346",
            "image": "https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Anoeta_estadioa_37%2C_Donostia%2C_Gipuzkoa%2C_Euskal_Herria.jpg/150px-Anoeta_estadioa_37%2C_Donostia%2C_Gipuzkoa%2C_Euskal_Herria.jpg"
        },
        {
            "id": "12",
            "title": "Abanca-Riazor",
            "geocoordinates": "43.3687223,-8.4196722",
            "image": "https://upload.wikimedia.org/wikipedia/commons/thumb/5/54/Estadio_de_Riazor_-_2.jpg/150px-Estadio_de_Riazor_-_2.jpg"
        },
        {
            "id": "13",
            "title": "Martínez Valero",
            "geocoordinates": "38.2671427,-0.6649998",
            "image": "https://upload.wikimedia.org/wikipedia/commons/thumb/8/80/Mart%C3%ADnez_Valero_%28interior_-_2015%29.jpg/150px-Mart%C3%ADnez_Valero_%28interior_-_2015%29.jpg"
        },
        {
            "id": "14",
            "title": "La Romareda",
            "geocoordinates": "41.6364817,-0.9040131",
            "image": "https://upload.wikimedia.org/wikipedia/commons/thumb/c/cd/Grada_Norte_La_Romareda.jpg/150px-Grada_Norte_La_Romareda.jpg"
        }
    ]
}
""".utf8)
    }
}
