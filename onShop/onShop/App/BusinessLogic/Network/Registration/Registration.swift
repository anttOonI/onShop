//
//  Registration.swift
//  onShop
//
//  Created by AntonSobolev on 03.08.2021.
//

import Foundation
import Alamofire

class Registration: AbstractRequestFactory {
	
	let errorParser: AbstractErrorParser
	let sessionManager: Session
	let queue: DispatchQueue
	
	init(errorParser: AbstractErrorParser, sessionManager: Session, queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
		
		self.errorParser = errorParser
		self.sessionManager = sessionManager
		self.queue = queue
	}
}

extension Registration: RegistrationRequestFactory {
	
	func registration(userID: Int, userName: String, password: String, email: String, gender: String, creditCard: String, bio: String, completionHandler: @escaping (AFDataResponse<RegistrationResult>) -> Void) {
		
		let requestModel = SignUp(userID: userID, username: userName, password: password, email: email, gender: gender, creditCard: creditCard, bio: bio)
		self.request(request: requestModel, completionHandler: completionHandler)
	}
	
}

extension Registration {
	
	struct SignUp: RequestRouter {

		let path: String = "registerUser.json"
		
		let userID: Int
		let username: String
		let password: String
		let email: String
		let gender: String
		let creditCard: String
		let bio: String
		
		var parameters: Parameters? {
			return ["id_user": userID,
					"username": username,
					"password": password,
					"email": email,
					"gender": gender,
					"credit_card": creditCard,
					"bio": bio
			]
		}
	}
}
