//
//  MovieMainDetailsTableViewCell.swift
//  MovieTask
//
//  Created by Omar Khaled Ali on 2/22/19.
//  Copyright © 2019 Omar Khaled Ali. All rights reserved.
//

import UIKit

class MovieMainDetailsTableViewCell: UITableViewCell {

  
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    
    private let placeHolderName: String = Asset.imagePlaceHolder.rawValue
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func populateView(movie: MovieMainDetailsViewModel?) {
        guard let movie = movie else {
            dummyCell()
            return
        }
        
        overviewLabel.text = movie.overView
        titleLabel.text = movie.title
        yearLabel.text = movie.date
        overviewLabel.alpha = 1
        titleLabel.alpha = 1
        yearLabel.alpha = 1
        switch movie.posterPath {
        case let .link(path)?:
             posterImageView.downloaded(from: path)
        case let .data(image)?:
            posterImageView.image = image
        case .none:
            posterImageView.image = UIImage(named: placeHolderName)
        }
       
    }
    
    func dummyCell() {
        overviewLabel.text = "Omar"
        titleLabel.text = "Omar"
        yearLabel.text = "Omar"
        overviewLabel.alpha = 0
        titleLabel.alpha = 0
        yearLabel.alpha = 0
        posterImageView.image = UIImage(named: placeHolderName)
    }
    
}
