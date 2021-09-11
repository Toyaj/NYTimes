//
//  NYArticleModelTest.swift
//  NYTimes
//
//  Created by Toyaj Nigam on 10/09/21.
//

import XCTest
@testable import NYTimes

class NYArticleModelTest: XCTestCase {
    
    var articleInfo: NYArticleModel?
    var articleMdl: ArcticleDetails?
    
    override func setUp() {
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
    
    func testArticleTotalCount() {
        XCTAssertEqual(articleInfo?.results.count, 20)
    }
}
