//
//  AdditionalInfoViewController.swift
//  02SignUp
//
//  Created by 구민영 on 29/08/2019.
//  Copyright © 2019 구민영. All rights reserved.
//

import UIKit

class AdditionalInfoViewController: UIViewController {
    // MARK:- IBOutlets
    @IBOutlet weak var cancelButton: UIButton?
    @IBOutlet weak var backButton: UIButton?
    @IBOutlet weak var signUpButton: UIButton?
    @IBOutlet weak var birthLabel: UILabel?
    @IBOutlet weak var datePicker: UIDatePicker?
    @IBOutlet weak var phoneNumberField: UITextField?
    
    var isValidDate: Bool = false
    let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        return dateFormatter
    }()
    
    // MARK:- Methods
    // MARK: Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        initBirthLabelText()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTargets()
        initFieldKeyboardType()
    }
    
    // MARK: Overrided Method
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
          self.view.endEditing(true)
    }
    
    // MARK: Custom Method
    func addTargets() {
        cancelButton?.addTarget(self, action: #selector(touchUpCancelButton), for: .touchUpInside)
        backButton?.addTarget(self, action: #selector(touchUpBackButton), for: .touchUpInside)
        signUpButton?.addTarget(self, action: #selector(touchUpSignUpButton), for: .touchUpInside)
        datePicker?.addTarget(self, action: #selector(pickerValueChanged), for: .valueChanged)
        phoneNumberField?.addTarget(self, action: #selector(editingDidChanged), for: .editingChanged)
    }
    
    func initFieldKeyboardType() {
        phoneNumberField?.keyboardType = .numberPad
    }
    
    func initBirthLabelText() {
        guard let displayedDate = datePicker?.date else {return}
        birthLabel?.text = dateFormatter.string(from: displayedDate)
    }
    
    func checkUserInfo() -> Bool {
        guard phoneNumberField?.text != "", isValidDate
            else {return false}
        
        return true
    }
    
    // MARK: Action Method
    @objc func pickerValueChanged(_ sender: UIDatePicker) {
        initBirthLabelText()
        isValidDate = true
        signUpButton?.isEnabled = checkUserInfo()
    }
    
    @objc func touchUpCancelButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        // 데이터 초기화
    }

    @objc func touchUpBackButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
        // 데이터 유지
        // UserInformation에 저장
    }
    
    @objc func touchUpSignUpButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        // 다음 뷰에서 텍스트필드에 ID 표시
        // UserInformation에 저장
    }
    
    @objc func editingDidChanged(_ sender: UITextField) {
        signUpButton?.isEnabled = checkUserInfo()
    }
}


