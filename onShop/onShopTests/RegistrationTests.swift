//
//  RegistrationTests.swift
//  onShopTests
//
//  Created by AntonSobolev on 09.08.2021.
//

import XCTest
@testable import onShop

class RegistrationTests: XCTestCase {
	
	var requestFactory: RequestFactory!
	var registration: RegistrationRequestFactory!
	let expectation = XCTestExpectation(description: "Rescponce from back-end")
	
	override func setUpWithError() throws {
		requestFactory = RequestFactory()
		registration = requestFactory.makeRegistrationRequestFactory()
	}
	
	override func tearDownWithError() throws {
		// Put teardown code here. This method is called after the invocation of each test method in the class.
	}
	
	func testRegistration() throws {
		// given
		let userID = 123
		let userName = "Somebody"
		let password = "mypassword"
		let email = "some@some.ru"
		let gender = "m"
		let creditCard = "9872389-2424-234224-234"
		let bio = "This is good! I think I will switch to another language"
		
		// when
		registration.registration(userID: userID, userName: userName, password: password, email: email, gender: gender, creditCard: creditCard, bio: bio) { response in
			// then
			switch response.result {
			case .success(let register):
				print("🟢--------- RegisterResult here----->\(register)🟢")
			case .failure(let error):
				print(error.localizedDescription)
				XCTFail(error.localizedDescription)
			}
			self.expectation.fulfill()
		}
		wait(for: [expectation], timeout: 10)
	}
	
	func testPerformanceExample() throws {
		// This is an example of a performance test case.
		self.measure {
			// Put the code you want to measure the time of here.
		}
	}
	
}
