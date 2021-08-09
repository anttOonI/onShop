//
//  RequestRouter.swift
//  onShop
//
//  Created by AntonSobolev on 31.07.2021.
//

import Foundation
import Alamofire

enum RequestRouterEncoding {
	case url, json
}

protocol RequestRouter: URLRequestConvertible {
	var baseUrl: URL { get }
	var method: HTTPMethod { get }
	var path: String { get }
	var parameters: Parameters? { get }
	var fullUrl: URL { get }
	var encoding: RequestRouterEncoding { get }
}

extension RequestRouter {
	
	var baseUrl: URL {
		return URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/")!
	}
	
	var method: HTTPMethod {
		return .get
	}
	
	var fullUrl: URL {
		return baseUrl.appendingPathComponent(path)
	}
	
	var encoding: RequestRouterEncoding {
		return .url
	}
	
	func asURLRequest() throws -> URLRequest {
		var urlRequest = URLRequest(url: fullUrl)
		urlRequest.httpMethod = method.rawValue
		
		switch self.encoding {
		case .url:
			return try URLEncoding.default.encode(urlRequest, with: parameters)
		case .json:
			return try JSONEncoding.default.encode(urlRequest, with: parameters)
		}
		
	}
}

