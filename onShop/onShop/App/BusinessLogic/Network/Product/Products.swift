//
//  Products.swift
//  onShop
//
//  Created by AntonSobolev on 06.08.2021.
//

import Foundation
import Alamofire

class Products: AbstractRequestFactory {
	
	let errorParser: AbstractErrorParser
	let sessionManager: Session
	let queue: DispatchQueue
	
	init(errorParser: AbstractErrorParser, sessionManager: Session, queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
		self.errorParser = errorParser
		self.sessionManager = sessionManager
		self.queue = queue
	}
}

extension Products: ProductRequestFactory {
	
	func listOfProduct(pageNumber: Int, categoryID: Int, completionHandler: @escaping (AFDataResponse<[Product]>) -> Void) {
		
		let requestModel = GetListOfProduct(pageNumber: pageNumber, categoryID: categoryID)
		self.request(request: requestModel, completionHandler: completionHandler)
	}
	
	func oneProduct(productID: Int, completionHandler: @escaping (AFDataResponse<OneProduct>) -> Void) {
		let requestModel = GetOneProduct(productID: productID)
		self.request(request: requestModel, completionHandler: completionHandler)

	}
	
}

extension Products {
	
	struct GetListOfProduct: RequestRouter {
		
		let path: String = "catalogData.json"
		
		let pageNumber: Int
		let categoryID: Int
		
		var parameters: Parameters? {
			return ["page_number": pageNumber,
					"id_category": categoryID
			]
		}
	}
	
	struct GetOneProduct: RequestRouter {
		
		let path: String = "getGoodById.json"
		
		let productID: Int
		
		var parameters: Parameters? {
			return ["id_product": productID]
		}

	}
}
