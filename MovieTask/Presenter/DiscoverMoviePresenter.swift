//
//  DiscoverMoviePresenter.swift
//  MovieTask
//
//  Created by Omar Khaled Ali on 2/22/19.
//  Copyright © 2019 Omar Khaled Ali. All rights reserved.
//
import  Foundation

protocol  DiscoverMovieDelegate {
    //TODO
    func reloadData(withMovie movie: [MovieMainDetailsViewModel]?)
}

class DiscoverMoviePresenter {
    private var fetchDiscoverMovieWorker: FetchDiscoverMovieWorker?
    private var discoverMovieDelegate: DiscoverMovieDelegate?
    
    init(delegate: DiscoverMovieDelegate) {
        discoverMovieDelegate = delegate
        
        fetchDiscoverMovieWorker = FetchDiscoverMovieWorker(presenter: self)
    }
    
    func fetchDiscoverMovie() {
        fetchDiscoverMovieWorker?.execute(success: { successModel in
            let movie =  self.mapToUIModel(movies: successModel?.movies)
            DispatchQueue.main.async {
                self.discoverMovieDelegate?.reloadData(withMovie: movie)
            }
        }, requestModel: 1)
    }
    
    func mapToUIModel(movies: [Movie]?) -> [MovieMainDetailsViewModel]? {
        guard movies != nil else {
            return nil
        }
        
        let moviesViewModel: [MovieMainDetailsViewModel] = movies!.map({
            movie in
            var movieViewModel = MovieMainDetailsViewModel()
            movieViewModel.date = movie.releaseDate ?? ""
            movieViewModel.language = movie.language?.uppercased() ?? ""
            movieViewModel.psoterPath = movie.posterPath
            movieViewModel.voteAverage = movie.rating == nil ? "\(movie.rating!)" : ""
            movieViewModel.overView = movie.overview ?? ""
            movieViewModel.title = movie.title ?? ""
            return movieViewModel
        })
        
        return moviesViewModel
    }
    
    deinit {
        print("Class removed")
    }
    
    
}

extension DiscoverMoviePresenter: ErrorHandler {
    func showGenericError() {
        //TODO: -
    }
}
