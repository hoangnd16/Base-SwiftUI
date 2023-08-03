//
//  API.swift
//  Base-SwiftUI
//
//  Created by ECO1152-HOANGND on 03/08/2023.
//

import Foundation
import Alamofire

enum APIState {
    case loading
    case success
    case failure
}

enum APIRouter {
    case login
    case register
    case forgotPassword
}

extension APIRouter: AppRequestConvertible {
    
    var baseURL: URL {
        return URL(string: "https://hoang.doan.net")!
    }
    
    var path: String {
        switch self {
        case .login:
            return "/login"
        case .register:
            return "/register"
        case .forgotPassword:
            return "/forgot-password"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .login:
            return .post
        case .register:
            return .post
        case.forgotPassword:
            return .post
        }
    }
    
    var headers: HTTPHeaders {
        return HTTPHeaders.default
    }
    
    var parameters: Parameters? {
        return [:]
    }
    
    var encoding: ParameterEncoding {
        switch method {
        case .get:
            return URLEncoding.default
        default:
            return JSONEncoding.default
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = baseURL.appendingPathComponent(path)
        var request = URLRequest(url: url)
        request.method = method
        request.headers = headers
        return try encoding.encode(request.asURLRequest(), with: parameters)
    }
}
