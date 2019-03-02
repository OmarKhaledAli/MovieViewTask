//
//  APIWorker.swift
//  MovieTask
//
//  Created by Omar Khaled Ali on 2/22/19.
//  Copyright © 2019 Omar Khaled Ali. All rights reserved.
//

import Foundation


protocol APIWorker {
    associatedtype ResponseType: Codable
    associatedtype RequestType: Codable
    
    func execute(success: @escaping (_ response: ResponseType?)->(), requestModel: RequestType?)
    init(presenter: ErrorHandler)
    
}

extension APIWorker {
    var networkManager: NetworkManager {
        return NetworkManager()
    }
}
