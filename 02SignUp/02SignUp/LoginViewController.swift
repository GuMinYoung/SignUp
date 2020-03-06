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
    @IBOutlet weak var identifierField: UITextField?
    @IBOutlet weak var passwordField: UITextField?
    
    // MARK:- Methods
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: IBActions
    @IBAction func touchUpSignInButton(_ sender: UIButton) {
        guard let id = identifierField?.text, let password = passwordField?.text else {return}
        UserInformation.shared.id = id
        UserInformation.shared.password = password
    }
    
    @IBAction func touchUpSignUpButton(_ sender: UIButton) {
        guard let basicInfoView = self.storyboard?.instantiateViewController(withIdentifier: "SignUpNavigation") else { return }
        basicInfoView.modalPresentationStyle = .fullScreen
        self.present(basicInfoView, animated: true, completion: nil)
    }
}
