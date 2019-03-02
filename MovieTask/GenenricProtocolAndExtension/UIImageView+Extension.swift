//
//  UIImageView+Extension.swift
//  MovieTask
//
//  Created by Omar Khaled Ali on 2/23/19.
//  Copyright © 2019 Omar Khaled Ali. All rights reserved.
//

import UIKit

extension UIImageView {
    func downloaded(from url: String?, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        guard url != nil else { return }
        
        contentMode = mode
        addLoadingIndector()
        
        let networkManager = NetworkManager()
        networkManager.downloadData(forEndPoint: ImageDownloader.downloadImage(imagePath: url!), completion: {[weak self] data, error in
            guard let `self` = self else { return }
            
            if let data = data, error == nil {
                let image = UIImage(data: data)
                DispatchQueue.main.async() {
                    self.removeLoadingIndector()
                    self.image = image
                }
            } else {
                DispatchQueue.main.async() {
                    self.removeLoadingIndector()
                    self.image = UIImage(named: Asset.imagePlaceHolder.rawValue)
                }
                return
            }
        })
       
    }
    
    func addLoadingIndector() {
        let activityIndicator = UIActivityIndicatorView(style: .whiteLarge)
        activityIndicator.frame = CGRect.init(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)
        activityIndicator.startAnimating()
        self.addSubview(activityIndicator)
    }
    
    func removeLoadingIndector() {
        for view in self.subviews {
            if view is UIActivityIndicatorView {
                view.removeFromSuperview()
            }
        }
    }
}


