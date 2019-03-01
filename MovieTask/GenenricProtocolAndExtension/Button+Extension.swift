//
//  Button+Extension.swift
//  MovieTask
//
//  Created by Omar Khaled Ali on 3/1/19.
//  Copyright © 2019 Omar Khaled Ali. All rights reserved.
//
import UIKit

extension UIButton {
        func setBackground(color: UIColor, for state: UIControl.State) {
            UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
            UIGraphicsGetCurrentContext()!.setFillColor(color.cgColor)
            UIGraphicsGetCurrentContext()!.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
            let colorImage: UIImage? = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            setBackgroundImage(colorImage, for: state)
        }
}
