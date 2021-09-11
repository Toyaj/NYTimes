//
//  HomeModelView.swift
//  NYTimes
//
//  Created by Toyaj Nigam on 10/09/21.
//

import Foundation

class HomeViewModel {
    
    let networkManager: NetworkManager = NetworkManager()
    
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

extension HomeViewModel {
    
    func getArticles(completionHandler: @escaping (Result<Bool, Error>) -> Void) {
        
        networkManager.getNYArticles { result in
            switch result {
            case .success(let arcticleDetails):
                self.model = arcticleDetails
                completionHandler(.success(true))
            case .failure(let error):
                completionHandler(.failure(error))
                
            }
        }
    }
}
