//
//  TabbarView.swift
//  Base-SwiftUI
//
//  Created by ECO1152-HOANGND on 03/08/2023.
//

import SwiftUI

struct TabbarView: View {
    @SceneStorage("tabbarIndex") var tabbarIndex = 0
    
    var body: some View {
        TabView(selection: $tabbarIndex, content: {
            NavigationView(content: {
                HomeView()
            })
            .tabItem {
                Label("Home", systemImage: "homekit")
            }

            
            NavigationView(content: {
                SettingView()
            })
            .tabItem {
                Label("User", systemImage: "person")
            }
        })
        .onAppear() {
            UITabBar.appearance().barTintColor = .black
            let image = UIImage.gradientImageWithBounds(
                bounds: CGRect( x: 0, y: 0, width: UIScreen.main.scale, height: 8),
                colors: [
                    UIColor.clear.cgColor,
                    UIColor.black.withAlphaComponent(0.1).cgColor
                ]
            )
            let appearance = UITabBarAppearance()
            appearance.configureWithTransparentBackground()
            appearance.backgroundColor = UIColor.systemGray6
                    
            appearance.backgroundImage = UIImage()
            appearance.shadowImage = image

            UITabBar.appearance().standardAppearance = appearance
        }
        .accentColor(.black)
    }
}

struct TabbarView_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView()
    }
}
