//
//  MyMovieDetialsView.swift
//  MovieTask
//
//  Created by Omar Khaled Ali on 2/27/19.
//  Copyright © 2019 Omar Khaled Ali. All rights reserved.
//

import UIKit

class MyMovieDetialsView: UIView, UITextViewDelegate, NibOwnerLoadable {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var releaseTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        loadNibContent()
        
        descriptionTextView.text = "Write Your Description here"
        descriptionTextView.delegate = self
        descriptionTextView.textColor = UIColor.lightGray
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if descriptionTextView.textColor == UIColor.lightGray {
            descriptionTextView.text = nil
            descriptionTextView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Placeholder"
            textView.textColor = UIColor.lightGray
        }
    }

}

public extension UIView {
    
    class func fromNib<T: UIView>() -> T {
        return Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
    
}
