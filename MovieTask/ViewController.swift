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
    @IBOutlet weak var addNewMovieButton: UIButton!
    
    //MARK:- properities
    private var presenter: DiscoverMoviePresenter?
    private var movie: [MovieMainDetailsViewModel]?
    private var navigator: DiscoverMovieNavigator?
    
    //MARK:- lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPresenter()
        setupTableView()
        fetchMovieData()
        configureAddNewMovieButton()
       
    }
    
    //MARK:- Configure Presenter
    func setupPresenter() {
        presenter = DiscoverMoviePresenter(delegate: self)
        //TODO Forcewrapping
        navigator = DiscoverMovieNavigator(navigationController: self.navigationController!)
    }
    
    func configureAddNewMovieButton() {
        addNewMovieButton.setTitleColor(.red, for: .normal)
        addNewMovieButton.setTitle("Add new Movie", for: .normal)
        addNewMovieButton.setBackground(color: .black, for: .normal)
    }
    
    func fetchMovieData() {
        presenter?.fetchDiscoverMovie()
    }
    
    //MARK:- Configure Views
    func setupTableView() {
        movieTableView.delegate = self
        movieTableView.dataSource = self
        movieTableView.prefetchDataSource = self
        movieTableView.register(UINib(nibName: "MovieMainDetailsTableViewCell", bundle: nil), forCellReuseIdentifier: "MovieMainDetailsTableViewCell")
     
        movieTableView.rowHeight = UITableView.automaticDimension
        movieTableView.estimatedRowHeight = 50
        
        
        movieTableView.decelerationRate = UIScrollView.DecelerationRate.normal;
    }

    @IBAction func addNewMovieButtonAction(_ sender: Any) {
        navigator?.navigate(to: .createNewMovie)
    }
}

extension ViewController: DiscoverMovieDelegate {
    func dataSourceItem() -> [MovieMainDetailsViewModel]? {
        return movie
    }
    
    func reloadData(withMovie movie: [MovieMainDetailsViewModel]?) {
        guard movie != nil else {return}
        
        self.movie =  movie
        movieTableView.reloadData()
    }
    
    func reloadRowsData(withMovie newMovie: [MovieMainDetailsViewModel]?, atIndex index: [IndexPath],completion: (()->Void)?) {
        self.movie = self.movie == nil ? [] : self.movie
        
        self.movie?.append(contentsOf: newMovie!)
        movieTableView.reloadRows(at: index, with: .automatic)
        completion!()
        
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource,UITableViewDataSourcePrefetching {
    
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        if indexPaths.contains(where: isLoadingCell) {
           presenter?.fetchDiscoverMovie()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  movie == nil ? 0 : 10000
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieMainDetailsTableViewCell", for: indexPath) as! MovieMainDetailsTableViewCell
        
        if isLoadingCell(for: indexPath) {
            cell.populateView(movie: nil)
        } else {
            cell.populateView(movie: movie![indexPath.row])
        }
        
        return cell
    }
    
    private func isLoadingCell(for indexPath: IndexPath) -> Bool {
        guard  movie != nil else { return true }
        
        return indexPath.row >= movie!.count
    }
    
    func visibleIndexPathsToReload(intersecting indexPaths: [IndexPath]) -> [IndexPath] {
        let indexPathsForVisibleRows = movieTableView.indexPathsForVisibleRows ?? []
        let indexPathsIntersection = Set(indexPathsForVisibleRows).intersection(indexPaths)
        return Array(indexPathsIntersection)
    }
}
