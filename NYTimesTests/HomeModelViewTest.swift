//
//  HomeModelViewTest.swift
//  NYTimesTests
//
//  Created by Toyaj Nigam on 10/09/21.
//

import XCTest
@testable import NYTimes

class HomeModelViewTest: XCTestCase {
    
    var articleInfo: NYArticleModel?
    let mdlView: HomeViewModel = HomeViewModel()
    var articleMdl: ArcticleDetails?
    
    override func setUpWithError() throws {
        do {
            if let filePath = Bundle.init(for: NYTimesTests.self).path(forResource: "Articles", ofType: "json"), let data = NSData(contentsOfFile: filePath) {
                do {
                    articleInfo = try JSONDecoder().decode(NYArticleModel.self, from: data as Data)
                    XCTAssertNotNil(articleInfo)
                } catch {
                    //Handle error
                }
            }
        }
    }
    
    func testNetworkManager() {
        XCTAssertNotNil(mdlView.networkManager)
    }
    
    func testNYArticleModel() {
        XCTAssertEqual(articleInfo?.results.count, 20)
    }
    
    func testArticleAPICall() {
        
        XCTAssertNotNil(mdlView.networkManager.getNYArticles(completionHandler: { result in
            switch result {
            case .success(let articleDetails):
                XCTAssertNotNil(articleDetails)
            case .failure(let error):
                XCTAssertNotNil(error)
            }
        }))
    }
    
    func testGetArticles() {
        XCTAssertNotNil(mdlView.getArticles(completionHandler:))
        mdlView.getArticles { result in
            
            switch result {
            case .success(let isSucess):
                XCTAssertTrue(isSucess)
            case .failure(let error):
                XCTAssertNotNil(error)
            }
            XCTAssertNotNil(result)
        }
    }
}
