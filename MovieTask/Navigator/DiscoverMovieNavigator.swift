//
//  DiscoverMovieNavigator.swift
//  MovieTask
//
//  Created by Omar Khaled Ali on 2/28/19.
//  Copyright © 2019 Omar Khaled Ali. All rights reserved.
//
import UIKit

class DiscoverMovieNavigator: Navigator {
    enum Destination {
        case createNewMovie
    }
    
    private weak var navigationController: UINavigationController?
    
    // MARK: - Initializer
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Navigator
    func navigate(to destination: Destination) {
        let viewController = makeViewController(for: destination)
        //TODO :force wrapping here
        navigationController?.pushViewController(viewController!, animated: true)
    }
    
    // MARK: - Private
    private func makeViewController(for destination: Destination) -> UIViewController? {
        switch destination {
        case .createNewMovie:
            return createNewMovie()
        }
    }
    
    private func createNewMovie() -> UIViewController? {
        let viewController = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "CreateMovieViewController") as? CreateMovieViewController
        return viewController
    }
}
