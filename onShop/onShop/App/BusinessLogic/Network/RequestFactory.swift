//
//  RequestFactory.swift
//  onShop
//
//  Created by AntonSobolev on 31.07.2021.
//

import Foundation
import Alamofire

class RequestFactory {
	
	func makeErrorParser() -> AbstractErrorParser {
		return ErrorParser()
	}
	
	lazy var commonSession: Session = {
		let configuration = URLSessionConfiguration.default
		configuration.httpShouldSetCookies = false
		configuration.headers = .default
		let manager = Session(configuration: configuration)
		return manager
	}()
	
	let sessionQueue = DispatchQueue.global(qos: .utility)
	
	func makeAuthRequestFatory() -> AuthRequestFactory {
		let errorParser = makeErrorParser()
		return Auth(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
	}
	
	func makeRegistrationRequestFactory() -> RegistrationRequestFactory {
		let errorParser = makeErrorParser()
		return Registration(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
	}
	
	func changeUserData() -> ChangeUserDataRequestFactory {
		let errorParser = makeErrorParser()
		return ChangeUserData(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
	}
	
	func productsCalalogue() -> ProductRequestFactory {
		let errorParser = makeErrorParser()
		return Products(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
	}
	
	func oneProduct() -> ProductRequestFactory {
		let errorParser = makeErrorParser()
		return Products(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
	}
}
