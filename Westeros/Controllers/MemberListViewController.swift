//
//  MemberListViewController.swift
//  Westeros
//
//  Created by Fco_Javier_Rodriguez on 30/9/18.
//  Copyright © 2018 Fco_Javier_Rodriguez. All rights reserved.
//

import UIKit

class MemberListViewController: UIViewController {

    // MARK: Properties
    var modelPerson: [Person]
    
    // MARK: Oulet
    @IBOutlet weak var tableView: UITableView!

    // MARK: - Initialization
    init(modelPerson: [Person]) {
        self.modelPerson = modelPerson
        
        super.init(nibName: nil, bundle: nil)
        
        title = Constants.membersTitle
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Mark: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // FUNDAMENTAL!!! No olvidarse de contar al tableview quienes son sus ayudantes (datasource y delegate)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Observe houseVC notification changes
        NotificationCenter.default.addObserver(self, selector: #selector(houseDidChange), name: .houseDidChangeNotification, object: nil)
        
    }
    
    @objc func houseDidChange(notification: Notification) {
        // Get user information
        guard let information = notification.userInfo else { return }
        // Get season from user information
        guard let house: House = information[Constants.HouseKey] as? House else { return }
        modelPerson = house.sortedMembers
        
        // Syncronize the view with the model
        tableView.reloadData()
    }
}

extension MemberListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelPerson.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Descubrimos cual es la Person que hay que mostrar
        let person = modelPerson[indexPath.row]
        
        // Creamos la celda (o nos la dan de cache)
        var cell = tableView.dequeueReusableCell(withIdentifier: Constants.personCellId)
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: Constants.personCellId)
        }
        
        // Sincronizar modelo-vista (person-cell)
        cell?.textLabel?.text = person.name
        cell?.detailTextLabel?.text = person.alias
        
        return cell!
    }
}

extension MemberListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let person = modelPerson[indexPath.row]
        
        let memberDetailViewController = MemberDetailViewController(modelPerson: person)
        
        navigationController?.pushViewController(memberDetailViewController, animated: true)
    }
}
