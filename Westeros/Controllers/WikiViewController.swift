//
//  WikiViewController.swift
//  Westeros
//
//  Created by Fco_Javier_Rodriguez on 29/9/18.
//  Copyright © 2018 Fco_Javier_Rodriguez. All rights reserved.
//

import UIKit
import WebKit

class WikiViewController: UIViewController {

    // MARK: Properties
    var modelHouse: House
    
    // MARK: Oulet
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var loadingView: UIActivityIndicatorView!
    
    
    // MARK: - Initialization
    init(modelHouse: House){
        self.modelHouse = modelHouse
        super.init(nibName: nil, bundle: nil)
        title = "\(Constants.wikiTitle) \(modelHouse.name)"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Subcribe in event and when a house is modified execute method houseDidChange
        NotificationCenter.default.addObserver(self, selector: #selector(houseDidChange), name: .houseDidChangeNotification, object: nil)
        title = "\(Constants.wikiTitle) \(modelHouse.name)"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Unsubcribe
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Asignar delegados
        webView.navigationDelegate = self
        syncModelWithView()
        title = "\(Constants.wikiTitle) \(modelHouse.name)"
    }
    
    @objc func houseDidChange(notification: Notification){
        // Get information and get the house
        guard let info = notification.userInfo,
            let house: House = info[Constants.HouseKey] as? House else { return }
        
        // Update the model
        self.modelHouse = house
        
        // Synchronize model/View
        syncModelWithView()
    }
    
    // MARK: - Sync
    func syncModelWithView(){
        let request: URLRequest = URLRequest(url: modelHouse.wikiURL)
        loadingView.startAnimating()
        webView.load(request)
    }
}
extension WikiViewController: WKNavigationDelegate{
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!){
        // Stop spinner
        loadingView.stopAnimating()
        
        // Hidde spinner
        loadingView.isHidden = true
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        let type = navigationAction.navigationType
        
        switch type {
        case .linkActivated, .formSubmitted, .formResubmitted:
            decisionHandler(.cancel)
            
        default:
            decisionHandler(.allow)
        }
    }
}
