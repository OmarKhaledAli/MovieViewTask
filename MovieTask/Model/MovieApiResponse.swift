//
//  MovieApiResponse.swift
//  MovieTask
//
//  Created by Omar Khaled Ali on 2/22/19.
//  Copyright © 2019 Omar Khaled Ali. All rights reserved.
//

struct MovieApiResponse {
    let page: Int?
    let numberOfResults: Int?
    let numberOfPages: Int?
    let movies: [Movie]?
}

extension MovieApiResponse: Codable {
    
    enum CodingKeys: String, CodingKey {
        case page
        case numberOfResults = "total_results"
        case numberOfPages = "total_pages"
        case movies = "results"
    }
}
