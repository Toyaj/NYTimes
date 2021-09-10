//
//  HomeViewController.swift
//  NYTimesTests
//
//  Created by Toyaj Nigam on 11/09/21.
//

import XCTest
@testable import NYTimes

class HomeViewControllerTest: XCTestCase {
    
    var homeViewCntr: NYTimes.HomeViewController!
    let viewModel: HomeViewModel = HomeViewModel()
    let networkManager: NetworkManager = NetworkManager()
    var articleInfo: NYArticleModel?
    var articleMdl: ArcticleDetails?
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        self.homeViewCntr = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as?  NYTimes.HomeViewController
        self.homeViewCntr.loadView()
        self.homeViewCntr.viewDidLoad()
        homeViewCntr.ib_tblView.register(UINib(nibName: "ArticleTableViewCell", bundle: nil), forCellReuseIdentifier: "ArticleTableViewCell")
        XCTAssertNotNil(homeViewCntr.ib_tblView)
        XCTAssertNotNil(homeViewCntr.ib_tblView.tableFooterView)
        XCTAssertNotNil(homeViewCntr.progressHUD)
        
        do {
            if let filePath = Bundle.init(for: NYTimesTests.self).path(forResource: "Articles", ofType: "json"), let data = NSData(contentsOfFile: filePath) {
                do {
                    articleInfo = try JSONDecoder().decode(NYArticleModel.self, from: data as Data)
                    viewModel.model = articleInfo?.results
                    XCTAssertNotNil(articleInfo)
                } catch {
                    //Handle error
                }
            }
        }
        
    }
    
    func testViewControllerTitle() {
        XCTAssertEqual(homeViewCntr.title, Constant.ViewControllerTitle.homeTitle.rawValue)

    }
    
    func testLoadViewSetsTablDataSource() {
        XCTAssertTrue(homeViewCntr.ib_tblView?.dataSource is NYTimes.HomeViewController)
    }
    
    func testLoadViewSetsTablDelegate() {
        XCTAssertTrue(homeViewCntr.ib_tblView?.delegate is NYTimes.HomeViewController)
    }
    
    func testDataSourceDelegateSameInstance() {
        XCTAssertEqual(homeViewCntr.ib_tblView?.dataSource as! NYTimes.HomeViewController, homeViewCntr.ib_tblView.delegate as! NYTimes.HomeViewController)
    }
    
    func testgetArticles() {
        XCTAssertNotNil(homeViewCntr.getArticles())
    }
    
    func testNumberOFRowInSection() {
        let count = homeViewCntr.ib_tblView.numberOfRows(inSection: 0)
        XCTAssertNotEqual(count, 20)
    }
    
    func testCellForRowAtIndex() {
        let value: Int = 0
        let actualCell = homeViewCntr.ib_tblView.dataSource?.tableView(homeViewCntr.ib_tblView, cellForRowAt: IndexPath(row: 0, section: 0))
        
        guard let cell = actualCell as? ArticleTableViewCell else {
            return
        }
        cell.viewModel.model = viewModel.getArticleDetail(item: 0)
        XCTAssertNotNil(viewModel.getArticleDetail(item: 0))
        XCTAssertNotNil(cell.viewModel.model)
        cell.prepareForCell()
        let arcticleDetails: ArcticleDetails = (viewModel.model?[value])!
        XCTAssertEqual(cell.viewModel.model?.assetID, arcticleDetails.assetID)
    }
    
    func testDidSelectRowAtIndex() {
        
        homeViewCntr.ib_tblView.delegate?.tableView?(homeViewCntr.ib_tblView, didSelectRowAt: IndexPath(row: 0, section: 0))
        XCTAssertNotNil(viewModel.getArticleDetail(item: 0))
    }
    
}
