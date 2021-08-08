//
//  ProductsResult.swift
//  onShop
//
//  Created by AntonSobolev on 06.08.2021.
//

import Foundation

struct Product: Codable {
	let productID: Int
	let productName: String
	let price: Int
	
	enum CodingKeys: String, CodingKey {
		case productID = "id_product"
		case productName = "product_name"
		case price
	}
}
