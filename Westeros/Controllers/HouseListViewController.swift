//
//  HouseListViewController.swift
//  Westeros
//
//  Created by Fco_Javier_Rodriguez on 29/9/18.
//  Copyright © 2018 Fco_Javier_Rodriguez. All rights reserved.
//

import UIKit

// Delegate
protocol HouseListViewControllerDelegate {
    // First parameter of a function of the delagate is ALWAYS the same object
    // Method for know that element has been selected
    func houseListViewController(_ vc: HouseListViewController, didSelectHouse house: House)
}

class HouseListViewController: UITableViewController {
    
    // MARK: Properties
    let modelHouse: [House]
    var delegate: HouseListViewControllerDelegate?
    
    // MARK: Initializers (Markers)
    init (modelHouse: [House]){
        self.modelHouse = modelHouse
        super.init(nibName: nil, bundle: nil)
        title = Constants.housesTitle
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCustomCell()
    }
    
    // Method for register personalized cells
    func registerCustomCell() {
        // First step for use personalized cells -> Register them
        let nib = UINib(nibName: "HouseCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "HouseCell")
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // Return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows
        return modelHouse.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // 1. Know item to show (Selected House)
        let house = modelHouse[indexPath.row]
        
        // 2. Create a cell or receiver cell of the cache
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.houseCellId) as! HouseCell

        // 3. Synchronize the view(cell) and the model(House)
        cell.sigilImageView.image = house.sigil.image
        cell.nameLabel.text = house.name
        cell.wordsLabel.text = house.words
        
        // 4. Return cell
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 95
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 1. Know cell/row (house) selected
        let houseSelected = house(at: indexPath.row)
        // Saved last selected house
        saveLastSelectedHouse(at: indexPath.row)
        
        // The information ALWAYS is sended through of the methods delegates and notifications
        // 2. Report to delegate
        delegate?.houseListViewController(self, didSelectHouse: houseSelected)
        
        // 3. Send a notification
        let nc = NotificationCenter.default
        let notification = Notification(name: .houseDidChangeNotification, object: self, userInfo: [Constants.HouseKey: houseSelected])
        nc.post(notification)

    }
}

// MARK: Persistence (UserDefaults)
// Valid only for a litle count of objects (Array, Int, String...)
extension HouseListViewController {
    func saveLastSelectedHouse(at row: Int) {
        // Save last house selected
        let userDefaults = UserDefaults.standard
        // Add this house in dictyonary of User Defaults and synchronize
        userDefaults.set(row, forKey: Constants.lastHouseKey)
        userDefaults.synchronize()
    }
    
    // Get last selected house
    func lastSelectedHouse() -> House {
        // Know last selected row (if exist)
        let row = UserDefaults.standard.integer(forKey: Constants.lastHouseKey)
        return house(at: row)
    }
    
    // Get a house
    func house(at index: Int) -> House {
        return modelHouse[index]
    }
}

// Mark: Delegate
extension HouseListViewController: HouseListViewControllerDelegate {
    func houseListViewController(_ vc: HouseListViewController, didSelectHouse house: House) {
        let houseDetailViewController = HouseDetailViewController(modelHouse: house)
        navigationController?.pushViewController(houseDetailViewController, animated: true)
    }
}
