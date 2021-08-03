//
//  ChangeUserDataRequestFactory.swift
//  onShop
//
//  Created by AntonSobolev on 03.08.2021.
//

import Foundation
import Alamofire

protocol ChangeUserDataRequestFactory {
	func changeUserData(userID: Int, userName: String, password: String, email: String, gender: String, creditCard: String, bio: String,  completionHandler: @escaping (AFDataResponse<ChangeUserDataResult>) -> Void)
}
