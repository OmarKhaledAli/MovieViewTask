//
//  MovieTableViewCell.swift
//  MovieTaskUITests
//
//  Created by Omar Khaled Ali on 3/2/19.
//  Copyright © 2019 Omar Khaled Ali. All rights reserved.
//

import XCTest
@testable import MovieTask

class MyMovieViewTests: XCTestCase {

    func testExampleCheckEmptyView() {
        let myMovieDetialsView = MyMovieDetialsView()
        let movie = myMovieDetialsView.fetchMyMovie()
        
        
        XCTAssertTrue(movie == nil)
    }
    

}
