//
//  ArticleModelViewTest.swift
//  NYTimesTests
//
//  Created by Toyaj Nigam on 10/09/21.
//

import XCTest
@testable import NYTimes

class ArticleModelViewTest: XCTestCase {
    
    let mdlView: ArticleViewModel = ArticleViewModel()
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
        XCTAssertEqual(title, "Michael K. Williams, Omar From ‘The Wire,’ Is Dead at 54")
    }
    
    func testpublishDate() {
        let publishDate = mdlView.publishDate
        XCTAssertEqual(publishDate, "2021-09-06")
    }
    
    func testSectionName() {
        let sectionName = mdlView.sectionName
        XCTAssertEqual(sectionName, "Arts")
    }
    
    func testSubSectionName() {
        let subSectionName = mdlView.subSectionName
        XCTAssertEqual(subSectionName, "")
    }
    
    func testThumbnailImageURL() {
        let thumbnailImg = mdlView.thumnailUrl
        XCTAssertEqual(thumbnailImg, "https://static01.nyt.com/images/2021/09/07/obituaries/07michaelwilliams-obit1-sub/07michaelwilliams-obit1-sub-thumbStandard.jpg")
    }
    
    func testImageURL() {
        let img = mdlView.imageURl
        XCTAssertEqual(img, "https://static01.nyt.com/images/2021/09/07/obituaries/07michaelwilliams-obit1-sub/07michaelwilliams-obit1-sub-mediumThreeByTwo440.jpg")
    }
    
    func testDescriptionOFArticle() {
        let description = mdlView.description
        XCTAssertEqual(description, "Mr. Williams, who also starred in “Boardwalk Empire” and “Lovecraft Country,” was best known for his role as Omar Little in the David Simon HBO series.")
    }
    
    func testgetTitleOfArticle() {
        let title =  mdlView.getTitleOfArticle()
        XCTAssertEqual(title, "Michael K. Williams, Omar From ‘The Wire,’ Is Dead at 54")
    }
    
    func testgetPublishDate() {
        let publishDate = mdlView.getPublishDate()
        XCTAssertEqual(publishDate, "2021-09-06")
    }
    
    func testgetSectionName() {
        let sectionName = mdlView.getSectionName()
        XCTAssertEqual(sectionName, "Arts")
    }
    
    func testgetSubSectionName() {
        let subSectionName = mdlView.getSubSectionName()
        XCTAssertEqual(subSectionName, "")
    }
    
    func testgetThumbnailImageURL() {
        let thumbnailImg = mdlView.getThumbnailImageURL()
        XCTAssertEqual(thumbnailImg, "https://static01.nyt.com/images/2021/09/07/obituaries/07michaelwilliams-obit1-sub/07michaelwilliams-obit1-sub-thumbStandard.jpg")
    }
    
    func testgetImageURL() {
        let img = mdlView.getImageURL()
        XCTAssertEqual(img, "https://static01.nyt.com/images/2021/09/07/obituaries/07michaelwilliams-obit1-sub/07michaelwilliams-obit1-sub-mediumThreeByTwo440.jpg")
    }
    
    func testgetDescriptionOFArticle() {
        let description = mdlView.getDescriptionOFArticle()
        XCTAssertEqual(description, "Mr. Williams, who also starred in “Boardwalk Empire” and “Lovecraft Country,” was best known for his role as Omar Little in the David Simon HBO series.")
    }
    
}
