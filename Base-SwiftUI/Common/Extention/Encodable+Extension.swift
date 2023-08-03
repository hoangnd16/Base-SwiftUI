//
//  Encodable+Extension.swift
//  Base-SwiftUI
//
//  Created by ECO1152-HOANGND on 03/08/2023.
//

import Foundation

public extension Encodable {

    func toRequestParams() -> [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else {
            return nil
        }
        guard let dictionary = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
            //LogInfo("Error convert Encodable to Dictionary ")
            return nil
        }
        return dictionary
    }
}
