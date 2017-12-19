//
//  Attraction.swift
//  VirginiaBeach
//
//  Created by Isma Dia on 18/12/2017.
//  Copyright © 2017 Mobyview. All rights reserved.
//

import Foundation

class Attraction {
    
    var name : String?
    var image : String?
    var locationArea : String?
    var distance : String?
    var descrption : String?
    var categorie : String?
    var prix : String?
    var address : String?
    
    
    init(name : String, image: String, locationArea: String, distance: String, description : String, categorie : String, prix : String, address : String) {
        self.name = name
        self.image = image
        self.locationArea = locationArea
        self.distance = distance
        self.descrption = description
        self.categorie = categorie
        self.prix = prix
        self.address = address
    }
}
