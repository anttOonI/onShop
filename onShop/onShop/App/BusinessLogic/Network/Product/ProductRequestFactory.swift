//
//  ProductRequestFactory.swift
//  onShop
//
//  Created by AntonSobolev on 06.08.2021.
//

import Foundation
import Alamofire

protocol ProductRequestFactory {
	func listOfProduct(pageNumber: Int, categoryID: Int, completionHandler: @escaping (AFDataResponse<[Product]>) -> Void)
	func oneProduct(productID: Int, completionHandler: @escaping (AFDataResponse<OneProduct>) -> Void)
}
