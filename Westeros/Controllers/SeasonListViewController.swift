//
//  SeasonListViewController.swift
//  Westeros
//
//  Created by Fco_Javier_Rodriguez on 29/9/18.
//  Copyright © 2018 Fco_Javier_Rodriguez. All rights reserved.
//

import UIKit

// Delegate protocol
protocol SeasonListViewControllerDelgate{
    // Method for know the season selected (First param always is the same object)
    func seasonListViewController(_ vc: SeasonListViewController, didSelectSeason season: Season)
}

class SeasonListViewController: UITableViewController {
    
    // MARK: Properties
    let modelSeasons: [Season]
    var delegate: SeasonListViewControllerDelgate?
    
    // MARK: Initilializers (Markers)
    init (modelSeasons: [Season]){
        self.modelSeasons = modelSeasons
        super.init(nibName: nil, bundle: nil)
        title = Constants.seasonTitle
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // Number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Number of rows
        return modelSeasons.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Get season selected
        let season = modelSeasons[indexPath.row]
        
        // Get cell if exist else create a new cell
        var cell = tableView.dequeueReusableCell(withIdentifier: Constants.seasonCellId)
        if (cell == nil){
            cell = UITableViewCell(style: .default, reuseIdentifier: Constants.seasonCellId)
        }
        
        // Modified content of the cell
        cell?.textLabel?.text = season.name
        cell?.detailTextLabel?.text = "\(season.sortedEpisodes.count) episodios"

        return cell!
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // 1. Know cell/row (season) selected
        let season = modelSeasons[indexPath.row]
        
        // The information ALWAYS is sended through of the methods delegates and notifications
        // 2. Report to delegate
        delegate?.seasonListViewController(self, didSelectSeason: season)
        
        // 3. Send a notification
        let nc = NotificationCenter.default
        let notification = Notification(name: .seasonDidChangeNotification, object: self, userInfo: [Constants.SeasonKey: season])
        nc.post(notification)
    }
}

// MARK: Persistence (UserDefaults)
// Valid only for a litle count of objects (Array, Int, String...)
extension SeasonListViewController{
    // Save last season selected
    func saveLastSelectedSeason(at row: Int){
        // Save last season selected
        let userDefaults = UserDefaults.standard
        userDefaults.set(row, forKey: Constants.lastSeasonKey)
        userDefaults.synchronize()
    }
    
    // Get last selected house
    func lastSelectedSeason() -> Season {
        // Know last selected row (if exist)
        let row = UserDefaults.standard.integer(forKey: Constants.lastSeasonKey)
        return season(at: row)
    }
    
    // Get a season
    func season(at index: Int) -> Season {
        return modelSeasons[index]
    }
}

// MARK: Delegate
extension SeasonListViewController: SeasonListViewControllerDelgate {
    func seasonListViewController(_ vc: SeasonListViewController, didSelectSeason season: Season) {
        let seasonDetailViewController = SeasonDetailViewController(modelSeason: season)
        navigationController?.pushViewController(seasonDetailViewController, animated: true)
    }
}
