//
//  AddViewController.swift
//  MovieList
//
//  Created by Esraa Hassan on 3/25/20.
//  Copyright © 2020 Yahya. All rights reserved.
//

import UIKit
import CoreData
class AddViewController: UIViewController ,UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    //Outlets
    @IBOutlet weak var ratingTextField: UITextField!
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var genreTextField: UITextField!
    @IBOutlet weak var releaseYearTextField: UITextField!
    
    @IBOutlet weak var movieImageView: UIImageView!
    
    //Variables
    var tableViewControllerReference : InsertMovieProtocol?
    var addViewPresenter : AddViewProtocol?
    var mTitle = "",mImage = "",rating = "", releaseYear = "" , genre = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addViewPresenter = AddViewPresenter(mainScreen: tableViewControllerReference!)
        
        movieImageView.image = UIImage.init(named: mImage)
        
    }

    @IBAction func addButtonAction(_ sender: Any) {
        
        if validateInput() {
        
            addViewPresenter?.insertNewMovie(title: mTitle, image: mImage, rating: Float(rating) ?? 0.0, releaseYear: Int(releaseYear) ?? 2020 , genre: genre)
            
            self.navigationController?.popViewController(animated: false)               
        
        }else{
            let alert = UIAlertController(title: "Invalid Data", message: "Please enter all data before continue", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
        }
      
    }
    
    func validateInput() -> Bool {
        mTitle = (titleTextField.text ?? "")
        rating = (ratingTextField.text ?? "")
        releaseYear = (releaseYearTextField.text ?? "")
        genre = (genreTextField.text ?? "")
        
        if mTitle == "" || rating == "" || releaseYear == "" || genre == "" || mImage == ""{
            return false
        }
        return true
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func selectImageButtonAction(_ sender: Any) {
        let imgPicker = UIImagePickerController()
        imgPicker.delegate = self
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            imgPicker.sourceType = .photoLibrary
            imgPicker.allowsEditing = true
            self.present(imgPicker, animated: true, completion: nil)
        }
        else{
            print("cannot open photos")
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage{
            let imageData = UIImagePNGRepresentation(pickedImage)! as NSData
            mImage = imageData.base64EncodedString(options: .lineLength64Characters)
            movieImageView.image = pickedImage
            print("image added")
        }
         picker.dismiss(animated: true, completion: nil)
    }
    
}
