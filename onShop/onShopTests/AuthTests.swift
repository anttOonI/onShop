//
//  AuthTests.swift
//  onShopTests
//
//  Created by AntonSobolev on 09.08.2021.
//

import XCTest
@testable import onShop

class AuthTests: XCTestCase {
	
	var requestFactory: RequestFactory!
	var auth: AuthRequestFactory!
	let expectation = XCTestExpectation(description: "Rescponce from back-end")

    override func setUpWithError() throws {
		requestFactory = RequestFactory()
		auth = requestFactory.makeAuthRequestFatory()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLogin() throws {
		// given
		let userName = "Somebody"
		let password = "mypassword"
		// when
		auth.login(userName: userName, password: password) { response in
			// then
			switch response.result {
			case .success(let login):
				print("🟢--------- LoginResult here----->\(login)🟢")
				XCTAssert(true)
			case .failure(let error):
				print(error.localizedDescription)
				XCTFail(error.localizedDescription)
			}
			self.expectation.fulfill()
		}
		wait(for: [expectation], timeout: 10)
    }
	
	func testLogOut() throws {
		// given
		let userID = 123
		// when
		auth.logOut(userID: userID) { response in
			// then
			switch response.result {
			case .success(let logout):
				print("🟢--------- LogOutResult here----->\(logout)🟢")
				XCTAssert(true)
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
