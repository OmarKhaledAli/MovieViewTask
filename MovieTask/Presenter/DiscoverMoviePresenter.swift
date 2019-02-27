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
    func dataSourceItem() -> [MovieMainDetailsViewModel]?
    func visibleIndexPathsToReload(intersecting indexPaths: [IndexPath]) -> [IndexPath]
    func reloadRowsData(withMovie newMovie: [MovieMainDetailsViewModel]?, atIndex index: [IndexPath],completion: (()->Void)?)
}

class DiscoverMoviePresenter {
    private var fetchDiscoverMovieWorker: FetchDiscoverMovieWorker?
    private var discoverMovieDelegate: DiscoverMovieDelegate?
    private var currentPage = 1
    private var isFetchInProgress = false
    
    init(delegate: DiscoverMovieDelegate) {
        discoverMovieDelegate = delegate
        
        fetchDiscoverMovieWorker = FetchDiscoverMovieWorker(presenter: self)
    }
    
    func fetchDiscoverMovie() {
        guard !isFetchInProgress else {
            return
        }
        
        isFetchInProgress = true
        fetchDiscoverMovieWorker?.execute(success: { successModel in
            let newMovie =  self.mapToUIModel(movies: successModel?.movies)
            DispatchQueue.main.async {
                self.currentPage += 1
                if self.currentPage == 2 {
                    self.isFetchInProgress = false
                    self.discoverMovieDelegate?.reloadData(withMovie: newMovie)
                    
                } else {
                    let loadedIndex = self.calculateIndexPathsToReload(from: newMovie)
                     let indexPathsToReload = self.discoverMovieDelegate?.visibleIndexPathsToReload(intersecting:loadedIndex ?? [])
                self.discoverMovieDelegate?.reloadRowsData(withMovie: newMovie, atIndex: indexPathsToReload!,completion:{
                    self.isFetchInProgress = false
                })
                
               }
            }
        }, requestModel: currentPage)


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
        self.isFetchInProgress = true
    }
}


extension DiscoverMoviePresenter {
    //TODO :- How i will iuse these method
    private func calculateIndexPathsToReload(from newMovie: [MovieMainDetailsViewModel]?) -> [IndexPath]? {
        guard newMovie != nil else {
            return nil
        }
        
        let startIndex = discoverMovieDelegate?.dataSourceItem()?.count ?? 0
        let endIndex = (discoverMovieDelegate?.dataSourceItem()?.count ?? 0) + newMovie!.count
        
        return (startIndex..<endIndex).map { IndexPath(row: $0, section: 0) }
    }

}
