//
//  RootView.swift
//  Base-SwiftUI
//
//  Created by ECO1152-HOANGND on 03/08/2023.
//

import SwiftUI

class RootConfig: ObservableObject {
    
    @Published var rootType: RootType = .onboarding
    
    @AppStorage("isFinishOnboarding") var isFinishOnboarding = false
    @AppStorage("isLoggedIn") var isLoggedIn = false
    
    func initialRootType() {
        if !self.isFinishOnboarding {
            rootType = .onboarding
        } else {
            rootType = self.isLoggedIn ? .tabbar :.auth
        }
    }
    
    enum RootType {
        case onboarding
        case auth
        case tabbar
    }
}

struct RootView: View {
    
    @EnvironmentObject var rootConfig: RootConfig
    
    var body: some View {
        switch rootConfig.rootType {
        case .onboarding:
            OnboardingView()
        case .auth:
            NavigationView(content: {
                LoginView()
            })
        case .tabbar:
            TabbarView()
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
