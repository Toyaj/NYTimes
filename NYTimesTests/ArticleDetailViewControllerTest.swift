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
        
        do {
            if let filePath = Bundle.init(for: NYTimesTests.self).path(forResource: "Article", ofType: "json"), let data = NSData(contentsOfFile: filePath) {
                do {
                    mdlView.model = try JSONDecoder().decode(ArcticleDetails.self, from: data as Data)
                    XCTAssertNotNil(mdlView.model)
                } catch {
                    //Handle error
                }
            }
        }
        articleDetailViewCntr.updateUI()
    }
    
    func testTitle() {
        articleDetailViewCntr.ib_TittleLabel.text = mdlView.title
        XCTAssertEqual(articleDetailViewCntr.ib_TittleLabel.text, "Michael K. Williams, Omar From ‘The Wire,’ Is Dead at 54")
    }
    
    func testSubSectionLabel() {
        articleDetailViewCntr.ib_SectionSubSectionLabel.text = "\(mdlView.sectionName), \(mdlView.subSectionName)"
        XCTAssertEqual(articleDetailViewCntr.ib_SectionSubSectionLabel.text, "Arts, ")
    }
    
    func testPublishedDate() {
        articleDetailViewCntr.ib_PublishDateLabel.text = mdlView.publishDate
        XCTAssertEqual(articleDetailViewCntr.ib_PublishDateLabel.text, "2021-09-06")
        
    }
    
    func testArticleLabel() {
        articleDetailViewCntr.ib_ArticleDescLabel.text = mdlView.description
        XCTAssertEqual(articleDetailViewCntr.ib_ArticleDescLabel.text, "Mr. Williams, who also starred in “Boardwalk Empire” and “Lovecraft Country,” was best known for his role as Omar Little in the David Simon HBO series.")
    }
    
    func testImageURL() {
        
        guard let imageURL = mdlView.imageURl else { return }
        XCTAssertNotNil(imageURL)
        XCTAssertEqual(imageURL, "https://static01.nyt.com/images/2021/09/07/obituaries/07michaelwilliams-obit1-sub/07michaelwilliams-obit1-sub-mediumThreeByTwo440.jpg")
        articleDetailViewCntr.setImage(url: imageURL)
        XCTAssertNotNil(articleDetailViewCntr.setImage(url:imageURL))
        XCTAssertNotNil(articleDetailViewCntr.ib_ImageView)
    }

    func testImageView() {
        XCTAssertNotNil(articleDetailViewCntr.ib_ImageView)
    }
    
    func testViewControllerTitle() {
        XCTAssertEqual(articleDetailViewCntr.title, Constant.ViewControllerTitle.articleTitle.rawValue)
    }
    
    func testupdateUI() {
        XCTAssertNotNil(articleDetailViewCntr.updateUI())
    }

}
