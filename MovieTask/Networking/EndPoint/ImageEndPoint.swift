//
//  File.swift
//  MovieTask
//
//  Created by Omar Khaled Ali on 2/23/19.
//  Copyright © 2019 Omar Khaled Ali. All rights reserved.
//

import Foundation

public enum ImageDownloader {
    case downloadImage(imagePath: String)
}

extension ImageDownloader: EndPointType {

    var baseURL: URL {
        guard let url = URL(string: "https://image.tmdb.org/t/p/w200") else { fatalError("baseURL could not be configured.")}
        return url
    }
    
    var path: String {
        switch self {
        case .downloadImage(let imagePath):
            return imagePath

        }
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var task: HTTPTask {
        switch self {
        case .downloadImage:
            return .downloadData
        }
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
}

