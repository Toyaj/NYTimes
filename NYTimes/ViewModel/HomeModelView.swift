//
//  HomeModelView.swift
//  NYTimes
//
//  Created by Toyaj Nigam on 10/09/21.
//

import Foundation

class HomeModelView {
    
    var model: [ArcticleDetails]?
    
    var totalArticleCount: Int {
        getTotalArticleCount()
    }
    
    func getTotalArticleCount() -> Int {
        model?.count ?? 0
    }
    
    func getArticleDetail(item: Int) -> ArcticleDetails? {
        model?[item]
    }
}
