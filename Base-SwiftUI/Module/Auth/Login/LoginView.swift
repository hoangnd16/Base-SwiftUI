//
//  LoginView.swift
//  Base-SwiftUI
//
//  Created by ECO1152-HOANGND on 03/08/2023.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject private var viewModel: LoginViewModel = LoginViewModel()
    @EnvironmentObject var rootConfig: RootConfig
    
    init() {
    }
    
    var body: some View {
        ScrollView(content: {
            VStack(content: {
                Spacer(minLength: 50)
                Text("LOGIN")
                    .font(Font.system(size: 36, weight: .bold))
                    .foregroundColor(Color.black)
                Spacer(minLength: 30)
                TextField("Usename", text: $viewModel.model.username)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(lineWidth: 1)
                            .foregroundColor(.black)
                    )
                Spacer(minLength: 20)
                SecureField("Password", text: $viewModel.model.password)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(lineWidth: 1)
                            .foregroundColor(.black)
                   )
                Spacer(minLength: 50)
                Button("Login") {
                    viewModel.login()
                    rootConfig.isLoggedIn = true
                    rootConfig.rootType = .tabbar
                }
                .frame(width: 120)
                .padding()
                 .font(.system(size: 20, weight: Font.Weight.bold))
                 .foregroundColor(Color.white)
                 .background(RoundedRectangle(cornerRadius: 8).fill(Color.black))
                 .buttonStyle(PlainButtonStyle())
            })
            .padding(.horizontal, 20)
        })
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
