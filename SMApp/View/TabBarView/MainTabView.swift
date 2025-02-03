//
//  MainTabView.swift
//  SMApp
//
//  Created by Wedna Guirand on 18/01/2025.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem { Image(systemName: "house")}
                .tag(0)
                        
            ReportsListView()
                .tabItem { Image(systemName: "newspaper")}
                .tag(1)
            
            ProfileView()
                .tabItem { Image(systemName: "person")}
                .tag(2)
            
            Text("Contact Us and About Us View")
                .tabItem { Image(systemName: "phone.bubble")}
                .tag(3)
        }
        .tint(.primary)
    }
}

#Preview {
    MainTabView()
}
