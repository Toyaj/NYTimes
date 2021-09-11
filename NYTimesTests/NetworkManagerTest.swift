//
//  NetworkManagerTest.swift
//  NYTimes
//
//  Created by Toyaj Nigam on 10/09/21.
//

import XCTest
@testable import NYTimes

class NetworkManagerTest: XCTestCase {
    
    let networkManager: NetworkManager = NetworkManager()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    func testgetNYArticles() {
        
        XCTAssertNotNil(networkManager.getNYArticles(completionHandler:))
        
    }
}
