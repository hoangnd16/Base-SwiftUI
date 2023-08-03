//
//  SettingView.swift
//  Base-SwiftUI
//
//  Created by ECO1152-HOANGND on 03/08/2023.
//

import SwiftUI

struct SettingView: View {
    
    @EnvironmentObject var rootConfig: RootConfig
    
    var body: some View {
        VStack(content: {
            Button("Logout", action: {
                rootConfig.isLoggedIn = false
                rootConfig.rootType = .auth
            })
            .frame(width: 120)
            .padding()
             .font(.system(size: 14, weight: Font.Weight.bold))
             .foregroundColor(Color.white)
             .background(RoundedRectangle(cornerRadius: 8).fill(Color.black))
             .buttonStyle(PlainButtonStyle())
        })
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
