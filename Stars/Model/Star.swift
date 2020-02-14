//
//  Star.swift
//  Stars
//
//  Created by Claudia Contreras on 2/13/20.
//  Copyright © 2020 thecoderpilot. All rights reserved.
//

import Foundation

struct Star {
    var name: String
    var distance: Double
    
    // Computed Property
    var distanceDescription: String {
        return "\(distance) light years away"
    }
}
