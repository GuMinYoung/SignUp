//
//  BasicInfoViewController.swift
//  02SignUp
//
//  Created by 구민영 on 28/08/2019.
//  Copyright © 2019 구민영. All rights reserved.
//

import UIKit

class BasicInfoViewController: UIViewController {
    // MARK:- Properties
    let imagePicker = UIImagePickerController()

    
    // MARK:- IBOutlets
    @IBOutlet weak var imageView: UIImageView!
    
    
    // MARK:- Methods
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeGestureRecognizer()
        // Do any additional setup after loading the view.
    }
    
    // MARK: Action Method
    @objc func tapImageView(gestureRecognizer: UIGestureRecognizer) {
        openLibrary()
    }
    
    // MARK: Custom Method
    func initializeGestureRecognizer() {
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapImageView(gestureRecognizer:)))
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tapRecognizer)
    }
}

// MARK: UIImagePickerControllerDelegate, UINavigationControllerDelegate
extension BasicInfoViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func initializePicker() {
        imagePicker.delegate = self
        
    }
    
    func openLibrary() {
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
}
