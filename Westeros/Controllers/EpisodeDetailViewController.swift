//
//  EpisodeDetailViewController.swift
//  Westeros
//
//  Created by Fco_Javier_Rodriguez on 29/9/18.
//  Copyright © 2018 Fco_Javier_Rodriguez. All rights reserved.
//

import UIKit

class EpisodeDetailViewController: UIViewController {

    // MARK: - Properties
    var modelEpisode: Episode
    
    // MARK: Oulet
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    // MARK: Initializers (Markers)
    init(modelEpisode: Episode) {
        self.modelEpisode = modelEpisode
        
        super.init(nibName: nil, bundle: nil)
        title = modelEpisode.title
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(seasonDidChange), name: .seasonDidChangeNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func seasonDidChange(notification: Notification) {
        // Get user information
        guard let information = notification.userInfo else { return }
        // Get season from user information
        guard let season: Season = information[Constants.SeasonKey] as? Season else { return }
        modelEpisode = season.sortedEpisodes.first!
        
        syncModelWithView()
    }
    
    // MARK: Syncronization
    func syncModelWithView() {
        title = modelEpisode.title
        titleLabel.text = "Capítulo \(modelEpisode.number): \(modelEpisode.title)"
        dateLabel.text = modelEpisode.broadcastDateToString()
    }

}
