//
//  User.swift
//  02SignUp
//
//  Created by 구민영 on 30/08/2019.
//  Copyright © 2019 구민영. All rights reserved.
//

import Foundation
import UIKit

class UserInformation {
    static let shared: UserInformation = UserInformation()
    var id: String?
    var password: String?
    var profileImage: UIImage?
    var introduction: String?
    var phoneNumber: String?
    var birthDate: String?
}