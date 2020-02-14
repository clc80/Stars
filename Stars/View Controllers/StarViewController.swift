//
//  StarViewController.swift
//  Stars
//
//  Created by Claudia Contreras on 2/13/20.
//  Copyright © 2020 thecoderpilot. All rights reserved.
//

import UIKit

class StarViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet var starNameTextField: UITextField!
    @IBOutlet var distanceTextField: UITextField!
    @IBOutlet var tableView: UITableView!
    
    // MARK: - Properties
    // Source of Truth
    let starController = StarController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self

    }
    
    // MARK: - IBActions
    @IBAction func printStarsTapped(_ sender: Any) {
        //For development purposes only
        print(starController.listStars())
    }
    
    @IBAction func createButtonTapped(_ sender: Any) {
        
        // Validate the input before creating a star object
        guard let name = starNameTextField.text,
            let distanceString = distanceTextField.text,
            !name.isEmpty, !distanceString.isEmpty,
            let distance = Double(distanceString) else { return }
        
        // Now we want to create a star object
        starController.createStar(named: name, withDistance: distance)
        
        // Clear out the text field
        starNameTextField.text = ""
        distanceTextField.text = ""
        
        // Put the cursor back in this text field
        starNameTextField.becomeFirstResponder()
        
        // We want the table view to repopulate with that data
        tableView.reloadData()
    }
    

}

extension StarViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //The data is in the starController
        return starController.stars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: "StarCell", for: indexPath) as? StarTableViewCell else { return UITableViewCell() }
        
        let star = starController.stars[indexPath.row]
        cell.star = star
        return cell
    }
    
}

