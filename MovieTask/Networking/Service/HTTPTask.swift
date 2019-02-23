//
//  HTTPTask.swift
//  NetworkLayer
//
//  Created by Omar Khaled Ali on 2/19/19.
//  Copyright © 2019 Omar Khaled Ali. All rights reserved.
//

import Foundation

typealias HTTPHeaders = [String:String]

enum HTTPTask {
    case request
    
    case requestParameters(bodyParameters: Parameters?,
        bodyEncoding: ParameterEncoding,
        urlParameters: Parameters?)
    
    case requestParametersAndHeaders(bodyParameters: Parameters?,
        bodyEncoding: ParameterEncoding,
        urlParameters: Parameters?,
        additionHeaders: HTTPHeaders?)
    
    case downloadData
}


