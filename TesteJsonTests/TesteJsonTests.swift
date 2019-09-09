//
//  TesteJsonTests.swift
//  TesteJsonTests
//
//  Created by Alessandro on 06/09/19.
//  Copyright © 2019 Alessandro. All rights reserved.
//

import XCTest
@testable import TesteJson

class TesteJsonTests: XCTestCase {

    var gitHubEntity:GitHubEntity?
    
    override func setUp() {
        
    }

    override func tearDown() {
        
        
    }

    func testRepositories() {
        Repository.loadRepositories(language:"swift",onComplete: { (gitHubEntity) in
            
        XCTAssertGreaterThanOrEqual(gitHubEntity.items.count, 0)
            
        }) { (error) in
        
        XCTAssertNil(error)
            
        }
    }
    func testRepositoriesError() {
        Repository.loadRepositories(language:"jknlnnvlnvlnl",onComplete: { (gitHubEntity) in
            
            
        }) { (error) in
            
            XCTAssertNotNil(error)
            
        }
    }
    
    func testWithoutLanguage() {
        Repository.loadRepositories(language:"",onComplete: { (gitHubEntity) in
            
            XCTAssertGreaterThanOrEqual(gitHubEntity.items.count, 0)
            
        }) { (error) in
            
            XCTAssertNil(error)
            
        }
    }
    

//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

}
