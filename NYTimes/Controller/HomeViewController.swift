//
//  HomeViewController.swift
//  NYTimes
//
//  Created by Toyaj Nigam on 09/09/21.
//

import UIKit

 final class HomeViewController: UIViewController {
    
    @IBOutlet weak var ib_tblView: UITableView!
    let mdlView: HomeModelView = HomeModelView()
    let networkManager: NetworkManager = NetworkManager()
    let progressHUD = ProgressHud(text: "Processing...")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "NY Times Most Popular"
        ib_tblView.register(UINib(nibName: "ArticleTableViewCell", bundle: nil), forCellReuseIdentifier: "ArticleTableViewCell")
        ib_tblView.tableFooterView = UIView()
        self.view.addSubview(progressHUD)
        getArticles()
        
    }
    
    // MARK: - APICall
    func getArticles() {
        if Reachability.isConnectedToNetwork() {
            progressHUD.show()
            networkManager.getNYArticles { result in
                switch result {
                case .success(let arcticleDetails):
                    self.updateViewModel(with: arcticleDetails)
                case .failure(_):
                    self.showAlert()
                }
            }
        } else {
            self.alert(message: "Make sure your device is connected to the internet.", title: "No Internet Connection")
        }
    }
}

private extension HomeViewController {
    
    func updateViewModel(with articleDetails: [ArcticleDetails]) {
        mdlView.model = articleDetails
        DispatchQueue.main.async {
            self.progressHUD.hide()
            self.ib_tblView.reloadData()
        }
    }
    
    func showAlert() {
        DispatchQueue.main.async {
            self.progressHUD.hide()
            self.alert(message: "Please try after sometime", title: "Alert")
        }
    }
}
