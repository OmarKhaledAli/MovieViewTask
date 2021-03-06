//
//  ViewController.swift
//  MovieTask
//
//  Created by Omar Khaled Ali on 2/19/19.
//  Copyright © 2019 Omar Khaled Ali. All rights reserved.
//


import UIKit

class CreateMovieViewController: UIViewController {
   
    @IBOutlet weak var createMovieView: MyMovieDetialsView!
    
    private var imagePicker = UIImagePickerController()
    private var presenter: CreateMoviePresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        uploadImageFromPickerView()
        setupNavigationItem()
        setupPresenter()
        view.accessibilityIdentifier = "AddMovieView"
       
    }
    
    private func setupPresenter() {
        presenter = CreateMoviePresenter(delegate: self)
    }
    
    private func uploadImageFromPickerView() {
        self.imagePicker.delegate = self
        createMovieView.setImageLoadedButton(action: {
            [weak self] in
            if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
                
                
                self?.imagePicker.sourceType = .savedPhotosAlbum;
                self?.imagePicker.allowsEditing = false
                
                self?.present(self!.imagePicker, animated: true, completion: nil)
            }
        })
    }
    
    private func setupNavigationItem() {
        let addBarButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(addNewMovieDetails))
        addBarButton.accessibilityIdentifier = "Add"
        navigationItem.rightBarButtonItem = addBarButton
    }
    
    @objc func addNewMovieDetails() {
        presenter?.addMovie(newMovie:  createMovieView.fetchMyMovie())
    }
    
    
}

extension CreateMovieViewController: UINavigationControllerDelegate , UIImagePickerControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            createMovieView.setImage(image: image)
        }
        
        imagePicker.dismiss(animated: true, completion: nil);
    }
}


extension CreateMovieViewController: CreateMoviePresenterDelegate {
    func loadMovieDataSuccess() {
        navigationController?.popToRootViewController(animated: false)
    }
}


