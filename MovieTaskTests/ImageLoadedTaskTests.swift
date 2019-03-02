//
//  MovieTaskTests.swift
//  MovieTaskTests
//
//  Created by Omar Khaled Ali on 2/19/19.
//  Copyright © 2019 Omar Khaled Ali. All rights reserved.
//

import XCTest
@testable import MovieTask

class ImageLoadedTaskTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    

    func testExampleSuccessToFetchImage() {
        let imageView = UIImageView()
        imageView.downloaded(from: "https://image.tmdb.org/t/p/w200/7WsyChQLEftFiDOVTGkv3hFpyyt.jpg")

        XCTAssertTrue(imageView.image  != UIImage(named: Asset.imagePlaceHolder.rawValue))
    }
    
    func testExampleFailToFetchImage() {
        let imageView = UIImageView()
        imageView.downloaded(from: "https://image.tmdb.org/t/p/w200/7WsyChQLEftFiDOVTGkv3hFpyytww.jpg")
        
        XCTAssertTrue(imageView.image  != UIImage(named: Asset.imagePlaceHolder.rawValue))
    }
    
    func testExampleCheckLoadingIndicator() {
        let imageView = UIImageView()
        imageView.addLoadingIndector()
        
        let indicatorView = imageView.subviews.filter({$0 is UIActivityIndicatorView})
        
        XCTAssertTrue( indicatorView.isEmpty == false)
    }
    
    func testExampleRemoveLoadingIndicator() {
        let imageView = UIImageView()
        imageView.addLoadingIndector()
        imageView.removeLoadingIndector()
        
        let indicatorView = imageView.subviews.filter({$0 is UIActivityIndicatorView})
        
        XCTAssertTrue( indicatorView.isEmpty == true)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
