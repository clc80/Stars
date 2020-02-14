//
//  Star.swift
//  Stars
//
//  Created by Claudia Contreras on 2/13/20.
//  Copyright © 2020 thecoderpilot. All rights reserved.
//

import Foundation

//Need to say that this can be stored into data by conforming to Codable
struct Star: Codable {
    var name: String
    var distance: Double
    
    // Computed Property
    var distanceDescription: String {
        return "\(distance) light years away"
    }
    
    
}
