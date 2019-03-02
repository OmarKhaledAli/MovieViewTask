//
//  MovieMainDetailsViewModel.swift
//  MovieTask
//
//  Created by Omar Khaled Ali on 2/22/19.
//  Copyright © 2019 Omar Khaled Ali. All rights reserved.
//
import  UIKit


struct MovieMainDetailsViewModel {
    enum PosterType {
        case link(path: String)
        case data(image: UIImage)
    }

    var posterPath: PosterType?
    var title: String?
    var date: String?
    var language: String?
    var overView: String?
}
