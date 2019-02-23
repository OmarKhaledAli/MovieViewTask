//
//  EndPoint.swift
//  NetworkLayer
//
//  Created by Omar Khaled Ali on 2/19/19.
//  Copyright © 2019 Omar Khaled Ali. All rights reserved.
//
import Foundation

protocol EndPointType {
    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var task: HTTPTask { get }
    var headers: HTTPHeaders? { get }
}

