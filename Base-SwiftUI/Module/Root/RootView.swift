//
//  RootView.swift
//  Base-SwiftUI
//
//  Created by ECO1152-HOANGND on 03/08/2023.
//

import SwiftUI

class ViewRouter: ObservableObject {
    
    @Published var viewRouter: RootType = .onboarding
    
    @AppStorage("isFinishOnboarding") var isFinishOnboarding = false
    @AppStorage("isLoggedIn") var isLoggedIn = false
    
    func initialRootType() {
        if !self.isFinishOnboarding {
            viewRouter = .onboarding
        } else {
            viewRouter = self.isLoggedIn ? .tabbar :.auth
        }
    }
    
    enum RootType {
        case onboarding
        case auth
        case tabbar
    }
}

struct RootView: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        switch viewRouter.viewRouter {
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
