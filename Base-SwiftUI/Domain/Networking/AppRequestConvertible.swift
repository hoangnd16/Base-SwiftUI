//
//  AppRequestConvertiable.swift
//  Base-SwiftUI
//
//  Created by ECO1152-HOANGND on 03/08/2023.
//

import Foundation
import Alamofire

protocol AppRequestConvertible: URLRequestConvertible {
    var baseURL: URL { get }
    var method: HTTPMethod { get }
    var headers: HTTPHeaders { get }
    var path: String { get }
    var parameters: Parameters? { get }
    var encoding: ParameterEncoding { get }
}
