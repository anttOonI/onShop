//
//  ProductsTests.swift
//  onShopTests
//
//  Created by AntonSobolev on 09.08.2021.
//

import XCTest
@testable import onShop

class ProductsTests: XCTestCase {
	
	var requestFactory: RequestFactory!
	var products: ProductRequestFactory!
	var oneProduct: ProductRequestFactory!
	let expectation = XCTestExpectation(description: "Rescponce from back-end")

    override func setUpWithError() throws {
		requestFactory = RequestFactory()
		products = requestFactory.productsCalalogue()
		oneProduct = requestFactory.oneProduct()
	}

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
	
	func testCatalogue() throws {
		// given
		let pageNumber = 1
		let categoryID = 1
		
		// when
		products.listOfProduct(pageNumber: pageNumber, categoryID: categoryID) { response in
			// then
			switch response.result {
			case .success(let catalogue):
				print("🟢--------- Catalogue here----->\(catalogue)🟢")
			case .failure(let error):
				print(error.localizedDescription)
				XCTFail(error.localizedDescription)
			}
			self.expectation.fulfill()
		}
		wait(for: [expectation], timeout: 10)
	}

	func testOneProduct() throws {
		// given
		let productID = 123
		
		// when
		oneProduct.oneProduct(productID: productID) { response in
			// then
			switch response.result {
			case .success(let product):
				print("🟢--------- Product here----->\(product)🟢")
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
