//
//  HouseCell.swift
//  Westeros
//
//  Created by Fco_Javier_Rodriguez on 29/9/18.
//  Copyright © 2018 Fco_Javier_Rodriguez. All rights reserved.
//

import UIKit

class HouseCell: UITableViewCell {

    static let reuseIdentifier = String(describing: self)
    
    // MARK: Oulets
    @IBOutlet weak var sigilImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var wordsLabel: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        sigilImageView.image = nil
        nameLabel.text = nil
        wordsLabel.text = nil
    }

    
    
}
