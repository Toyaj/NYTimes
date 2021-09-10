//
//  NetworkManager.swift
//  NYTimes
//
//  Created by Toyaj Nigam on 10/09/21.
//

import Foundation

class NetworkManager {
    
    // MARK: - API Call
    
    func getNYArticles(completionHandler: @escaping (Result<[ArcticleDetails], NetworkError>) -> Void) {
        let url = URL(string: "https://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/7.json?api-key=8GstsrYFxhA7lKChT5gFSfrJj0xvDUd9")!
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            if let error = error {
                print("Error with fetching films: \(error)")
                completionHandler(.failure(.badURL))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                debugPrint("Error with the response, unexpected status code: \(response.debugDescription)")
                completionHandler(.failure(.badURL))
                return
            }
            
            if let data = data,
               let articleModel = try? JSONDecoder().decode(NYArticleModel.self, from: data) {
                completionHandler(.success(articleModel.results))
            }
        })
        task.resume()
    }
}

enum NetworkError: Error {
    case badURL
}
