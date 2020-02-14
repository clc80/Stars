//
//  StarController.swift
//  Stars
//
//  Created by Claudia Contreras on 2/13/20.
//  Copyright © 2020 thecoderpilot. All rights reserved.
//

import Foundation

// Model Controller = Source of truth (Data)
// Has 6 main methods it can have.
// CRUD - Create, Read, Update, Delete
// Save and Load

class StarController {
    
    // private set means that Stars can only be set by the star controller itself
    private(set) var stars: [Star] = []
    
    // CRUD
    // discardable Result allows us to be flexible about whether or not we want to do something with our result
    @discardableResult func createStar(named name: String, withDistance distance: Double) -> Star {
        
        // 1. create an instance of a star with the passed in info
        let star = Star(name: name, distance: distance)
        
        // 2. append it
        stars.append(star)
        
        // 3. return a star
        return star
        
    } // end of @discardableResult func createStar
    
}
