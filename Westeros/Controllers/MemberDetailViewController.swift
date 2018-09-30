//
//  MemberDetailViewController.swift
//  Westeros
//
//  Created by Fco_Javier_Rodriguez on 29/9/18.
//  Copyright © 2018 Fco_Javier_Rodriguez. All rights reserved.
//

import UIKit

class MemberDetailViewController: UIViewController {

    // MARK: Properties
    var modelPerson: Person!
    
    // MARK: Oulet
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var aliasLabel: UILabel!
    
    // MARK: Initializers (Markers)
    init(modelPerson: Person) {
        self.modelPerson = modelPerson
        
        super.init(nibName: nil, bundle: nil)
        
        title = modelPerson.name
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        syncModelWithView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // Observe season notification changes
        NotificationCenter.default.addObserver(self, selector: #selector(houseDidChange), name: .houseDidChangeNotification, object: nil)
    }
    
    // MARK: Syncronization
    func syncModelWithView() {
        title = modelPerson.name
        nameLabel.text = modelPerson.fullName
        aliasLabel.text = modelPerson.alias
    }
    
    // MARK: Notifications
    @objc func houseDidChange(notification: Notification) {
        // Get user information
        guard let information = notification.userInfo else { return }
        // Get season from user information
        guard let houses: House = information[Constants.HouseKey] as? House else { return }
        modelPerson = houses.sortedMembers.first!
        syncModelWithView()
    }
}
