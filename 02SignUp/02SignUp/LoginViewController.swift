//
//  LoginViewController.swift
//  02SignUp
//
//  Created by 구민영 on 28/08/2019.
//  Copyright © 2019 구민영. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    // MARK:- IBOutlets
    @IBOutlet weak var identifierField: UITextField!
    @IBOutlet weak var passwordField: UITextField!

    
    // MARK:- Methods
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: IBActions
    @IBAction func touchUpSignInButton(_ sender: UIButton) {
        UserInformation.shared.identifier = identifierField.text
        UserInformation.shared.password = passwordField.text
    }
    
    @IBAction func touchUpSignUpButton(_ sender: UIButton) {
        guard let BasicInfoView = self.storyboard?.instantiateViewController(withIdentifier: "BasicInfoView") else { return }
        self.present(BasicInfoView, animated: true, completion: nil)
    }
}
