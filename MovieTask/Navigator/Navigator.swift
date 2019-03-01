//
//  Navigator.swift
//  MovieTask
//
//  Created by Omar Khaled Ali on 2/28/19.
//  Copyright © 2019 Omar Khaled Ali. All rights reserved.
//

protocol Navigator {
    associatedtype Destination
    
    func navigate(to destination: Destination)
}
