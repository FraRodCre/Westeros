//
//  HouseDetailViewController.swift
//  Westeros
//
//  Created by Fco_Javier_Rodriguez on 29/9/18.
//  Copyright © 2018 Fco_Javier_Rodriguez. All rights reserved.
//

import UIKit

class HouseDetailViewController: UIViewController {

    // MARK: Properties
    var modelHouse: House
    
    // MARK: Outlets
    @IBOutlet weak var houseNameLabel: UILabel!
    @IBOutlet weak var sigilImage: UIImageView!
    @IBOutlet weak var wordsLabel: UILabel!
    
    // MARK: Initializers (Markers)
    init(modelHouse: House){
        self.modelHouse = modelHouse
        
        super.init(nibName: nil, bundle: nil)
        
        title = modelHouse.name
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
        navigationItem.leftItemsSupplementBackButton = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupUI()
        
        // Sincronizar modelo y vista
        syncModelWithView()
    }
    
    // MARK: - Syncronization
    func syncModelWithView() {
        title = modelHouse.name
        houseNameLabel.text = "Casa \(modelHouse.name)"
        sigilImage.image = modelHouse.sigil.image
        wordsLabel.text = modelHouse.words
    }
    
    func setupUI() {
        // Create navigation buttons
        let wikiButton = UIBarButtonItem(title: "Wiki", style: .plain, target: self, action: #selector(displayWiki))
        let membersButton = UIBarButtonItem(title: "Miembros", style: .plain, target: self, action: #selector(displayMembers))
        
        // Add button in navigationbar
        navigationItem.rightBarButtonItems = [membersButton, wikiButton]
    }
    
    @objc func displayWiki() {
        // Create destination VC
        let wikiViewController = WikiViewController(modelHouse: modelHouse)
        
        // Navigation to the VC through push
        navigationController?.pushViewController(wikiViewController, animated: true)
    }
    
    @objc func displayMembers() {
        let memberListViewController = MemberListViewController(modelPerson: modelHouse.sortedMembers)
        
        // Push
        navigationController?.pushViewController(memberListViewController, animated: true)
    }
}

extension HouseDetailViewController: HouseListViewControllerDelegate {
    func houseListViewController(_ vc: HouseListViewController, didSelectHouse house: House) {
        self.modelHouse = house
        syncModelWithView()
        
    }
}
