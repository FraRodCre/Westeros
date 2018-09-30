//
//  EpisodesViewController.swift
//  Westeros
//
//  Created by Fco_Javier_Rodriguez on 29/9/18.
//  Copyright © 2018 Fco_Javier_Rodriguez. All rights reserved.
//

import UIKit

class EpisodesViewController: UITableViewController {
        
    // MARK: - Properties
    var modelEpisodes: [Episode]
    
    // MARK: - Initializers (Markers)
    init(modelEpisodes: [Episode]) {
        self.modelEpisodes = modelEpisodes
        
        super.init(nibName: nil, bundle: nil)
        
        self.title = Constants.episodeTitle
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
        modelEpisodes = season.sortedEpisodes
        
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelEpisodes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Get Episode selected
        let episode = modelEpisodes[indexPath.row]
        
        // Get cell if exist else create a new cell
        var cell = tableView.dequeueReusableCell(withIdentifier: Constants.episodeCellId)
        if (cell == nil){
            cell = UITableViewCell(style: .default, reuseIdentifier: Constants.episodeCellId)
        }
        
        // Modified content of the cell
        cell?.textLabel?.text = "Episodio \(episode.number) \(episode.title)  - \(episode.broadcastDateToString())"
        cell?.detailTextLabel?.text = episode.season?.name
        
        return cell!

    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let episodes = episode(at: indexPath.row)
        
        let episodeDetailViewController = EpisodeDetailViewController(modelEpisode: episodes)
        
        navigationController?.pushViewController(episodeDetailViewController, animated: true)
    }
    
    func episode(at row: Int) -> Episode {
        return modelEpisodes[row]
    }
}
