//
//  LoginViewModel.swift
//  Base-SwiftUI
//
//  Created by ECO1152-HOANGND on 03/08/2023.
//

import Foundation

class LoginViewModel: ObservableObject {
    
    @Published var apiState: APIState = .loading
    @Published var model = LoginModel(username: "", password: "")
    
    func login() {
        
    }
}
