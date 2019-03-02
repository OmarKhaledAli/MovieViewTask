//
//  MyMovieDetialsView.swift
//  MovieTask
//
//  Created by Omar Khaled Ali on 2/27/19.
//  Copyright © 2019 Omar Khaled Ali. All rights reserved.
//

import UIKit

class MyMovieDetialsView: UIView, UITextViewDelegate, UINavigationControllerDelegate , NibOwnerLoadable, UIImagePickerControllerDelegate  {

    @IBOutlet private weak var titleTextField: UITextField!
    @IBOutlet private weak var releaseTextField: UITextField!
    @IBOutlet private weak var descriptionTextView: UITextView!
    @IBOutlet private weak var imageView: UIImageView!
    
    private var textPlaceHolder = "Write Your Description here"
    private let imagePlaceHolder = Asset.imagePlaceHolder.rawValue
    
    private var imageLoadedClousre: (()->())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        loadNibContent()
        
        descriptionTextView.text = textPlaceHolder
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
            textView.text = textPlaceHolder
            textView.textColor = UIColor.lightGray
        }
    }
    
    @IBAction func loadImageButtonAction(_ sender: Any) {
        guard imageLoadedClousre != nil else {
            return
        }
        
        imageLoadedClousre!()
    }
    
    func setImageLoadedButton(action: (()->())?) {
        imageLoadedClousre = action
    }
    
    func setImage(image: UIImage) {
        imageView.image = image
    }
    
    func fetchMyMovie() -> MovieMainDetailsViewModel {
        var myMovie = MovieMainDetailsViewModel()
        myMovie.title = titleTextField.text
        myMovie.date = releaseTextField.text
        myMovie.overView =  descriptionTextView.text == textPlaceHolder ? nil : descriptionTextView.text 
        myMovie.posterPath = .data(image: imageView.image ?? (UIImage(named: imagePlaceHolder))!)
        return myMovie
    }
    
    

}
