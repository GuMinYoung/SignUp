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
    @IBOutlet weak var idField: UITextField?
    @IBOutlet weak var passwordField: UITextField?
    @IBOutlet weak var signUpButton: UIButton?
    
    // MARK:- Methods
    // MARK: Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        idField?.text = UserInformation.shared.id
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTarget()
    }
    
    // MARK: Action Method
    @objc func touchUpSignUpButton(_ sender: UIButton) {
        UserInformation.shared.reset()
        
        guard let navigationVC = self.storyboard?.instantiateViewController(withIdentifier: "SignUpNavigation") else { return }
        navigationVC.modalPresentationStyle = .fullScreen
        
        self.present(navigationVC, animated: true, completion: nil)
    }
    
    // MARK: Override Method
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // MARK: Custom Method
    func addTarget() {
        signUpButton?.addTarget(self, action: #selector(touchUpSignUpButton), for: .touchUpInside)
    }
}
