//
//  OnboardingView.swift
//  Base-SwiftUI
//
//  Created by ECO1152-HOANGND on 03/08/2023.
//

import SwiftUI

struct OnboardingView: View {
    @State var selectedIndex = 0
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        TabView(selection: $selectedIndex) {
            Button("Goto step 2", action: {
                selectedIndex = 1
            })
            .tag(0)
            
            Button("Goto step 3", action: {
                selectedIndex = 2
            })
            .tag(1)
            
            Button("Finish", action: {
                viewRouter.isFinishOnboarding = true
                viewRouter.viewRouter = .auth
            })
            .tag(2)
        }
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .always))
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
