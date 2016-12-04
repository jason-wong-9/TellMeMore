//
//  ViewController.swift
//  TellMeMore
//
//  Created by Jason Wong on 2016-12-03.
//  Copyright © 2016 Jason Wong. All rights reserved.
//

import UIKit
import Clarifai

class MainVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var findoutmoreButton: UIButton!
    
    
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = false
        imagePicker.delegate = self
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            self.image.image = image
        } else {
            print("TASSI: A valid image wasn't selected")
        }
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addImageBtnTapped(_ sender: Any) {
        present(imagePicker, animated: true, completion: nil)
    }
    
    
    @IBAction func searchImageBtnTapped(_ sender: Any) {
        findoutmoreButton.isUserInteractionEnabled = false
        Request.makeRequest(image: self.image.image!, completionHandler: { (tags) in
            print("done")
           let destinationController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TagView") as! TagVC
            print("setting destinationControllers")
            destinationController.tags = tags
            print("sending tags")
            DispatchQueue.main.sync(execute: { 
                self.navigationController?.pushViewController(destinationController, animated: false)
            })
            print("view controller pushed")
            self.findoutmoreButton.isUserInteractionEnabled = true
            print("setting userinteraction")
        })
        
    }


}

