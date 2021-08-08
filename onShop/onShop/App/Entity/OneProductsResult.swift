//
//  OneProductsResult.swift
//  onShop
//
//  Created by AntonSobolev on 07.08.2021.
//

import Foundation

struct OneProduct: Codable {
	let result: Int
	let productName: String
	let price: Int
	let aboutProduct: String
	
	enum CodingKeys: String, CodingKey {
		case result
		case productName = "product_name"
		case price = "product_price"
		case aboutProduct = "product_description"
	}
}
