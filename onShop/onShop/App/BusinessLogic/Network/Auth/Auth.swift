//
//  Auth.swift
//  onShop
//
//  Created by AntonSobolev on 31.07.2021.
//

import Foundation
import Alamofire

class Auth: AbstractRequestFactory {
	let errorParser: AbstractErrorParser
	let sessionManager: Session
	let queue: DispatchQueue
	
	init(
		errorParser: AbstractErrorParser,
		sessionManager: Session,
		queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
		self.errorParser = errorParser
		self.sessionManager = sessionManager
		self.queue = queue
	}
}

extension Auth: AuthRequestFactory {
	
	func login(userName: String, password: String, completionHandler: @escaping (AFDataResponse<LoginResult>) -> Void) {
		let requestModel = Login(login: userName, password: password)
		self.request(request: requestModel, completionHandler: completionHandler)
	}
	
	func logOut(userID: Int, completionHandler: @escaping (AFDataResponse<LogOutResult>) -> Void) {
		let requestModel = LogOut(userID: userID)
		self.request(request: requestModel, completionHandler: completionHandler)
	}
}

extension Auth {
	struct Login: RequestRouter {

		let path: String = "login.json"
		
		let login: String
		let password: String
		var parameters: Parameters? {
			return [
				"username": login,
				"password": password
			]
		}
	}
	
	struct LogOut: RequestRouter {
		
		let path: String = "logout.json"
		
		let userID: Int
		
		var parameters: Parameters? {
			return [ "id_user": userID ]
		}

	}
}
