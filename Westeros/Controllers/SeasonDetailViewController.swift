//
//  SeasonDetailViewController.swift
//  Westeros
//
//  Created by Fco_Javier_Rodriguez on 29/9/18.
//  Copyright © 2018 Fco_Javier_Rodriguez. All rights reserved.
//

import UIKit

class SeasonDetailViewController: UIViewController {

    // MARK: Properties
    var modelSeason: Season
    
    // MARK: Oulet
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var numberEpisodesLabel: UILabel!
    @IBOutlet weak var premiereDateLabel: UILabel!
    
    // MARK: Initializers (Markers)
    init(modelSeason: Season){
        self.modelSeason = modelSeason
        super.init(nibName: nil, bundle: nil)
        
        title = modelSeason.name
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Cycle Life
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
        navigationItem.leftItemsSupplementBackButton = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Add button for navigate to episodes
        setupUI()
        
        syncModelWithView()
    }
    
    // MARK: - Syncronization
    func syncModelWithView() {
        titleLabel.text = modelSeason.name
        numberEpisodesLabel.text = "\(modelSeason.count) episodios"
        premiereDateLabel.text = modelSeason.premiereDateToString()
        title = modelSeason.name
    }
    
    func setupUI() {
        // Create navigation buttons
        let episodesButton = UIBarButtonItem(title: "Episodios", style: .plain, target: self, action: #selector(displayEpisodes))
        
        // Add button in navigationbar
        navigationItem.rightBarButtonItems = [episodesButton]
    }
    
    @objc func displayEpisodes() {
        // Create destination VC
        let episodeViewController = EpisodesViewController(modelEpisodes: modelSeason.sortedEpisodes)
        
        // Navigation to the VC through push
        navigationController?.pushViewController(episodeViewController, animated: true)
    }
}

// MARK: Delegate
extension SeasonDetailViewController: SeasonListViewControllerDelgate {
    func seasonListViewController(_ vc: SeasonListViewController, didSelectSeason season: Season) {
        self.modelSeason = season
        syncModelWithView()
    }
}
