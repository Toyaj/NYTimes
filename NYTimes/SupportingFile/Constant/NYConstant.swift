//
//  NYConstant.swift
//  NYTimes
//
//  Created by Toyaj Nigam on 10/09/21.
//

import Foundation

enum Constant {
    
    enum ViewControllerTitle: String {
        
        case homeTitle = "NY Times Most Popular"
        case articleTitle = "Article Details"
        case articleDetailViewControllerIdentifier = "ArticleDetailViewController"
        
    }
    
    enum ProgressHud: String {
        
        case text = "Processing..."
        
    }
    
    enum TableViewCellIdentifier: String {
        
        case article = "ArticleTableViewCell"
        
    }
    
    enum Alert: String {
        
        case internetTitle = "No Internet Connection"
        case internetMessage = "Make sure your device is connected to the internet."
        case apiFailMessage = "Please try after sometime"
        case alert = "Alert"
        
    }
    
    enum ImagePlaceholder: String {
        case image = "placeholder"
    }
}
