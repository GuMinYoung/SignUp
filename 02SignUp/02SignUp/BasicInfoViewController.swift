//
//  BasicInfoViewController.swift
//  02SignUp
//
//  Created by 구민영 on 28/08/2019.
//  Copyright © 2019 구민영. All rights reserved.
//

import UIKit
import Photos

class BasicInfoViewController: UIViewController {
    // MARK:- Properties
    let imagePicker = UIImagePickerController()

    
    // MARK:- IBOutlets
    @IBOutlet weak var profileImageView: UIImageView?
    @IBOutlet weak var cancelButton: UIButton?
    @IBOutlet weak var doneButton: UIButton?
    @IBOutlet weak var idField: UITextField?
    @IBOutlet weak var passwordField: UITextField?
    @IBOutlet weak var checkPasswordField: UITextField?
    @IBOutlet weak var introductionView: UITextView?
    
    // MARK:- Methods
    // MARK: Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initGestureRecognizer()
        initDelegates()
        addTargets()
    }
    
    // MARK: Action Method
    @objc func tapImageView(gestureRecognizer: UIGestureRecognizer) {
        openLibrary()
    }
    
    @objc func touchUpCancelButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        UserInformation.shared.reset()
    }
    
    @objc func touchUpDoneButton(_ sender: UIButton) {
        guard let profileImage = profileImageView?.image,
            let id = idField?.text,
            let password = passwordField?.text,
            let introduction = introductionView?.text else {return}
        
        UserInformation.shared.profileImage = profileImage
        UserInformation.shared.id = id
        UserInformation.shared.password = password
        UserInformation.shared.introduction = introduction
        
        guard let nextVC = storyboard?.instantiateViewController(withIdentifier: "AdditionalInfoView") else {return}
        
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @objc func editingDidEnd(_ sender: UITextField) {
        doneButton?.isEnabled = checkUserInfo()
    }
    
    // MARK: Override Method
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // MARK: Custom Method
    func initDelegates() {
        imagePicker.delegate = self
        introductionView?.delegate = self
    }
    
    func initGestureRecognizer() {
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapImageView(gestureRecognizer:)))
        profileImageView?.isUserInteractionEnabled = true
        profileImageView?.addGestureRecognizer(tapRecognizer)
    }
    
    func addTargets() {
        doneButton?.addTarget(self, action: #selector(touchUpDoneButton), for: .touchUpInside)
        cancelButton?.addTarget(self, action: #selector(touchUpCancelButton), for: .touchUpInside)
        idField?.addTarget(self, action: #selector(editingDidEnd), for: .editingChanged)
        passwordField?.addTarget(self, action: #selector(editingDidEnd), for: .editingChanged)
        checkPasswordField?.addTarget(self, action: #selector(editingDidEnd), for: .editingChanged)
    }
    
    func checkUserInfo() -> Bool {
        guard profileImageView?.image != nil,
            idField?.text != "",
            passwordField?.text != "",
            checkPasswordField?.text != "",
            introductionView?.text != "",
            passwordField?.text == checkPasswordField?.text
            else {return false}
        
        return true
    }
}

// MARK: UIImagePickerControllerDelegate, UINavigationControllerDelegate
extension BasicInfoViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func openLibrary() {
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else { return }

        profileImageView?.image = editedImage
        self.dismiss(animated: true, completion: nil)
        
        doneButton?.isEnabled = checkUserInfo()
    }
}

extension BasicInfoViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        doneButton?.isEnabled = checkUserInfo()
    }
}
