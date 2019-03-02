//
//  MovieTaskUITests.swift
//  MovieTaskUITests
//
//  Created by Omar Khaled Ali on 2/19/19.
//  Copyright © 2019 Omar Khaled Ali. All rights reserved.
//

import XCTest

class MovieTaskUITests: XCTestCase {
    var app: XCUIApplication!

    override func setUp() {
        continueAfterFailure = false

        app = XCUIApplication()
    }


    func testExample() {
        app.launch()
        
        XCTAssertTrue(app.isDisplayingDiscoverMovie)
        let addButtonExist = app.buttons["addNewMovie"].waitForExistence(timeout: 5)
        if addButtonExist {
            app.buttons["addNewMovie"].tap()
            XCTAssertFalse(app.isDisplayingDiscoverMovie)
        }
        
    }

}
