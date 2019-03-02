//
//  XCUIApplication+Discover.swift
//  MovieTaskUITests
//
//  Created by Omar Khaled Ali on 3/2/19.
//  Copyright © 2019 Omar Khaled Ali. All rights reserved.
//


import XCTest

extension XCUIApplication {
    var isDisplayingDiscoverMovie: Bool {
        return otherElements["DiscoverMovie"].exists
    }
    
    var isDisplayingCreateMovie: Bool {
        return otherElements["AddMovieView"].exists
    }
}
