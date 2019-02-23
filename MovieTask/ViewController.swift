//
//  ViewController.swift
//  MovieTask
//
//  Created by Omar Khaled Ali on 2/19/19.
//  Copyright © 2019 Omar Khaled Ali. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //MARK:- iboutlet
    @IBOutlet weak var movieTableView: UITableView!
    @IBOutlet weak var headerView: UIView!
    
    //MARK:- properities
    private var presenter: DiscoverMoviePresenter?
    private var movie: [MovieMainDetailsViewModel]? {
        didSet {
            print("")
        }
    }
    
    //MARK:- lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPresenter()
        setupTableView()
        fetchMovieData()
        
    }
    
    //MARK:- Configure Presenter
    func setupPresenter() {
        presenter = DiscoverMoviePresenter(delegate: self)
    }
    
    func fetchMovieData() {
        presenter?.fetchDiscoverMovie()
    }
    
    //MARK:- Configure Views
    func setupTableView() {
        movieTableView.delegate = self
        movieTableView.dataSource = self
        movieTableView.register(UINib(nibName: "MovieMainDetailsTableViewCell", bundle: nil), forCellReuseIdentifier: "MovieMainDetailsTableViewCell")
        
        movieTableView.rowHeight = UITableView.automaticDimension
        movieTableView.estimatedRowHeight = 50
    }


}

extension ViewController: DiscoverMovieDelegate {
    func reloadData(withMovie movie: [MovieMainDetailsViewModel]?) {
        self.movie = movie
        movieTableView.reloadData()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movie?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieMainDetailsTableViewCell", for: indexPath) as! MovieMainDetailsTableViewCell
        
        cell.populateView(movie: movie![indexPath.row])
        
        return cell
    }
}
