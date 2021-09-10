//
//  ArticleDetailViewControllerTest.swift
//  NYTimesTests
//
//  Created by Toyaj Nigam on 11/09/21.
//

import XCTest
@testable import NYTimes

class ArticleDetailViewControllerTest: XCTestCase {
    
    var articleDetailViewCntr: NYTimes.ArticleDetailViewController!
    let mdlView: ArticleViewModel = ArticleViewModel()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        self.articleDetailViewCntr = storyboard.instantiateViewController(withIdentifier: "ArticleDetailViewController") as?  NYTimes.ArticleDetailViewController
        self.articleDetailViewCntr.loadView()
        self.articleDetailViewCntr.viewDidLoad()
    }

    func testImageView() {
        XCTAssertNotNil(articleDetailViewCntr.ib_ImageView)
    }
    
    func testViewControllerTitle() {
        XCTAssertEqual(articleDetailViewCntr.title, Constant.ViewControllerTitle.articleTitle.rawValue)
    }

}
