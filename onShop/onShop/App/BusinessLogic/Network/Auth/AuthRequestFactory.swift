//
//  AuthRequestFactory.swift
//  onShop
//
//  Created by AntonSobolev on 31.07.2021.
//

import Foundation
import Alamofire

protocol AuthRequestFactory {
	func login(userName: String, password: String, completionHandler: @escaping (AFDataResponse<LoginResult>) -> Void)
	func logOut(userID: Int, completionHandler: @escaping (AFDataResponse<LogOutResult>) -> Void)
}

