//
//  FetchDiscoverMovieWorker.swift
//  MovieTask
//
//  Created by Omar Khaled Ali on 2/22/19.
//  Copyright © 2019 Omar Khaled Ali. All rights reserved.
//

import Foundation

class FetchDiscoverMovieWorker: APIWorker{
    
    required init(presenter: ErrorHandler) {
        //TODO: -
    }
    
    func execute(success: @escaping (MovieApiResponse?) -> (), requestModel: Int?) {
        guard requestModel != nil else { return }
        
        networkManager.fetchResponse(forEndPoint:  MovieApi.discoverMovies(page: requestModel!), completion: {
            (movieApi: MovieApiResponse?, error ) in
            
            guard error == nil else { //TODO:-
                return
            }
            
            
            success(movieApi)
        })
    }

}
