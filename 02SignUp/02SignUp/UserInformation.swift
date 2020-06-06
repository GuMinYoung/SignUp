//
//  User.swift
//  02SignUp
//
//  Created by 구민영 on 30/08/2019.
//  Copyright © 2019 구민영. All rights reserved.
//

import Foundation
import UIKit

final class UserInformation {
    // MARK:- *코드리뷰
    /*
    싱글턴패턴이라는 것은 앱을 실행하는 동안에 단 하나의 객체만 생성되는 것을 말합니다.
    물론, 강의와 애플 공식 문서에도 싱글턴 패턴에 대하여 작성하신 코드처럼 예시가 나와있지만
    외부에서 UserInfomation.shared 처럼 사용하지 않고 UserInfomation() 이렇게 객체를 생성할 수 있으므로 싱글턴 패턴이라고 볼 수 없습니다.
    1인 개발이라면 이를 인지하고 사용하지 않겠지만 보통 현업에서는 협업을 하는 경우가 많으므로, 동료 개발자가 이를 인지하지 못하고 새로운 객체를 만들어 사용할 수도 있습니다.
    이를 미연에 방지하기 위하여 initalizer를 private로 선언하여 외부에서 객체를 생성할 수 없도록 처리하는 방법이 많이 사용됩니다.
    아래 링크 참고 부탁드립니다.
    https://cocoacasts.com/what-is-a-singleton-and-how-to-create-one-in-swift
    */
    
    static let shared: UserInformation = UserInformation()
    
    private init() {}
    
    var id: String?
    var password: String?
    var profileImage: UIImage?
    var introduction: String?
    var phoneNumber: String?
    var birthDate: Date?
    
    func reset() {
        id = nil
        password = nil
        profileImage = nil
        introduction = nil
        phoneNumber = nil
        birthDate = nil
    }
}
