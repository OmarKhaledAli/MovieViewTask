//
//  FetchDiscoverMovieWorker.swift
//  MovieTask
//
//  Created by Omar Khaled Ali on 2/22/19.
//  Copyright © 2019 Omar Khaled Ali. All rights reserved.
//

import Foundation

class FetchDiscoverMovieWorker: APIWorker{
    var presenter: ErrorHandler?
    
    required init(presenter: ErrorHandler) {
        self.presenter = presenter
    }
    
    func execute(success: @escaping (MovieApiResponse?) -> (), requestModel: Int?) {
        guard requestModel != nil else { return }
        
        networkManager.fetchResponse(forEndPoint:  MovieApi.discoverMovies(page: requestModel!), completion: { [weak self]
            (movieApi: MovieApiResponse?, error ) in
            guard let `self` = self else { return }
            
            guard error == nil else {
                self.presenter?.showGenericError()
                return
            }
            
            
            success(movieApi)
        })
    }

}
