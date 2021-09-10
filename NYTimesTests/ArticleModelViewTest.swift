//
//  ArticleModelViewTest.swift
//  NYTimesTests
//
//  Created by Toyaj Nigam on 10/09/21.
//

import XCTest
@testable import NYTimes

class ArticleModelViewTest: XCTestCase {
    
    let mdlView: ArticleModelView = ArticleModelView()
    var articleMdl: ArcticleDetails?
    
    override func setUpWithError() throws {
        do {
            if let filePath = Bundle.init(for: NYTimesTests.self).path(forResource: "Article", ofType: "json"), let data = NSData(contentsOfFile: filePath) {
                do {
                    articleMdl = try JSONDecoder().decode(ArcticleDetails.self, from: data as Data)
                    mdlView.model = articleMdl
                    XCTAssertNotNil(articleMdl)
                } catch {
                    //Handle error
                }
            }
        }
    }
    
    func testTittle() {
        let title = mdlView.title
        XCTAssertEqual(title, "U.S. Soldier Tests Positive for Virus in South Korea")
    }
    
    func testpublishDate() {
        let publishDate = mdlView.publishDate
        XCTAssertEqual(publishDate, "2020-02-25")
    }
    
    func testSectionName() {
        let sectionName = mdlView.sectionName
        XCTAssertEqual(sectionName, "World")
    }
    
    func testSubSectionName() {
        let subSectionName = mdlView.subSectionName
        XCTAssertEqual(subSectionName, "Asia Pacific")
    }
    
    func testThumbnailImageURL() {
        let thumbnailImg = mdlView.thumnailUrl
        XCTAssertEqual(thumbnailImg, "https://static01.nyt.com/images/2020/02/26/world/26virus-briefing-1sub/26virus-briefing-1sub-thumbStandard-v3.jpg")
    }
    
    func testImageURL() {
        let img = mdlView.imageURl
        XCTAssertEqual(img, "https://static01.nyt.com/images/2020/02/26/world/26virus-briefing-1sub/26virus-briefing-1sub-mediumThreeByTwo440-v3.jpg")
    }
    
    func testDescriptionOFArticle() {
        let description = mdlView.description
        XCTAssertEqual(description, "The soldier, the first U.S. service member known to be infected, has been quarantined in his off-base residence, the military said.")
    }
    
    func testgetTitleOfArticle() {
        let title =  mdlView.getTitleOfArticle()
        XCTAssertEqual(title, "U.S. Soldier Tests Positive for Virus in South Korea")
    }
    
    func testgetPublishDate() {
        let publishDate = mdlView.getPublishDate()
        XCTAssertEqual(publishDate, "2020-02-25")
    }
    
    func testgetSectionName() {
        let sectionName = mdlView.getSectionName()
        XCTAssertEqual(sectionName, "World")
    }
    
    func testgetSubSectionName() {
        let subSectionName = mdlView.getSubSectionName()
        
        guard  mdlView.getSubSectionName() != "" else { XCTFail("No Data"); return }
        
        XCTAssertEqual(subSectionName, "Asia Pacific")
    }
    
    func testgetThumbnailImageURL() {
        let thumbnailImg = mdlView.getThumbnailImageURL()
        XCTAssertEqual(thumbnailImg, "https://static01.nyt.com/images/2020/02/26/world/26virus-briefing-1sub/26virus-briefing-1sub-thumbStandard-v3.jpg")
    }
    
    func testgetImageURL() {
        let img = mdlView.getImageURL()
        XCTAssertEqual(img, "https://static01.nyt.com/images/2020/02/26/world/26virus-briefing-1sub/26virus-briefing-1sub-mediumThreeByTwo440-v3.jpg")
    }
    
    func testgetDescriptionOFArticle() {
        let description = mdlView.getDescriptionOFArticle()
        XCTAssertEqual(description, "The soldier, the first U.S. service member known to be infected, has been quarantined in his off-base residence, the military said.")
    }
    
}
