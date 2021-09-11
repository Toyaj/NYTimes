//
//  HomeViewController.swift
//  NYTimes
//
//  Created by Toyaj Nigam on 09/09/21.
//

import UIKit

final class HomeViewController: UIViewController {
    
    @IBOutlet weak var ib_tblView: UITableView!
    
    let viewModel: HomeViewModel = HomeViewModel()
    let progressHUD = ProgressHud(text: Constant.ProgressHud.text.rawValue)
    
    override func viewDidLoad() {
       
        super.viewDidLoad()
        self.title = Constant.ViewControllerTitle.homeTitle.rawValue
        ib_tblView.register(UINib(nibName: Constant.TableViewCellIdentifier.article.rawValue, bundle: nil),
                            forCellReuseIdentifier: Constant.TableViewCellIdentifier.article.rawValue)
        ib_tblView.tableFooterView = UIView()
        self.view.addSubview(progressHUD)
        getArticles()
        
    }
    
    // MARK: - APICall
    func getArticles() {
        
        if Reachability.isConnectedToNetwork() {
            progressHUD.show()
            viewModel.getArticles { result in
                switch result {
                case .success(_):
                    self.updateView()
                case .failure(_):
                    self.showAlert()
                }
            }
        } else {
            self.alert(message: Constant.Alert.internetMessage.rawValue,
                       title: Constant.Alert.internetTitle.rawValue)
        }
    }
}

 extension HomeViewController {
    
    func updateView() {
       
        DispatchQueue.main.async {
            self.progressHUD.hide()
            self.ib_tblView.reloadData()
        }
    }
    
    func showAlert() {
       
        DispatchQueue.main.async {
            self.progressHUD.hide()
            self.alert(message: Constant.Alert.apiFailMessage.rawValue,
                       title: Constant.Alert.alert.rawValue)
        }
    }
}
