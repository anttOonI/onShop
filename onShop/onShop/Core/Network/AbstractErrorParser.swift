//
//  AbstractErrorParser.swift
//  onShop
//
//  Created by AntonSobolev on 31.07.2021.
//

import Foundation

protocol AbstractErrorParser {
	func parse(_ result: Error) -> Error
	func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error?
}

