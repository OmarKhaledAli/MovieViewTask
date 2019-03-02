//
//  CreateMoviePresenter.swift
//  MovieTask
//
//  Created by Omar Khaled Ali on 3/1/19.
//  Copyright © 2019 Omar Khaled Ali. All rights reserved.
//

import Foundation
protocol  CreateMoviePresenterDelegate {
    func loadMovieDataSuccess()
    
}


class CreateMoviePresenter {
    private var discoverMovieDelegate: CreateMoviePresenterDelegate?
    
    
    init(delegate: CreateMoviePresenterDelegate) {
        discoverMovieDelegate = delegate
    }
    
    func addMovie(newMovie: MovieMainDetailsViewModel?) {
        if let movie = newMovie{
            MyMovieList.shared.myMoives.append(movie)
            discoverMovieDelegate?.loadMovieDataSuccess()
        }
    }
    
}
