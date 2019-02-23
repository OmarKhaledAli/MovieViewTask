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
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func populateView(movie: MovieMainDetailsViewModel) {
        overviewLabel.text = movie.overView
        titleLabel.text = movie.title
        yearLabel.text = movie.date
        posterImageView.downloaded(from: movie.psoterPath)
    }
    
}
