//
//  StarTableViewCell.swift
//  Stars
//
//  Created by Claudia Contreras on 2/13/20.
//  Copyright © 2020 thecoderpilot. All rights reserved.
//

import UIKit

class StarTableViewCell: UITableViewCell {
    
    var star: Star? {
        didSet {
            updateViews()
        }
    }

    //MARK: - IBOutlets
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var distanceLabel: UILabel!
    
    //MARK: - Method
    private func updateViews() {
        nameLabel.text = star?.name
        distanceLabel.text = "\(star!.distance)"
    }
    
}
