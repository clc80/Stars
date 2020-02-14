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
    
    // Private set means that Stars can only be set by the star controller itself
    private(set) var stars: [Star] = []
    
    // MARK: - Persistence
    // For persistence (place to store the data) which is a computed property
    private var persistentFileURL: URL? {
        
        //It only has once place to store so we grab an instance of it
        //Singleton - Single Instance that can be used throughout the app
        let fileManager = FileManager.default
        
        //navigate to the location where the documetns are stored
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        
        //Creating a file named stars
        return documents.appendingPathComponent("stars.plist")
    }
    
    
    //MARK: - Methods
    // CRUD
    // Discardable Result allows us to be flexible about whether or not we want to do something with our result
    @discardableResult func createStar(named name: String, withDistance distance: Double) -> Star {
        
        // 1. Create an instance of a star with the passed in info
        let star = Star(name: name, distance: distance)
        
        // 2. Append it
        stars.append(star)
        
        //2a. Save the data in our plist
        saveToPersistentStore()
        
        // 3. Return a star
        return star
        
    } // end @discardableResult func createStar
    
    // List the stars in star controller
    func listStars() -> String {
        var output = ""
        for star in stars {
            output += "\(star.name) is \(star.distanceDescription).\n"
        }
        
        return output
    } // end func listStars()
    
    //Save and load methods
    func saveToPersistentStore() {
        //place to store the data
        guard let url = persistentFileURL else { return }
        
        //Need to convert the data to something that can be stored on the phone
        do {
            //Get ready to encode the data
            let encoder = PropertyListEncoder()
            //the encoded data
            let data = try encoder.encode(stars)
            //write to the url
            try data.write(to: url)
        } catch {
            print("Error saving star data: \(error)")
        }
        
    }
    
}

