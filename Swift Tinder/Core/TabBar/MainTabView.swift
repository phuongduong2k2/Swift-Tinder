//
//  MainTabView.swift
//  Swift Tinder
//
//  Created by Duong Phuong on 8/5/25.
//

import SwiftUI

public enum Tab: Hashable {
    case main
    case favorite
    case search
    case chat
    case profile
}

struct MainTabView: View {
    @State private var selectedTab = Tab.main
    
    var body: some View {
        TabView(selection: $selectedTab) {
            CardStackView()
                .tabItem{ Image(selectedTab == .main ? .activeFlame : .inactiveFlame) }
                .tag(Tab.main)
            
            Text("Favorite View")
                .tabItem { Image(selectedTab == .favorite ? .activeFavorite : .inactiveFavorite) }
                .tag(Tab.favorite)
            
            Text("Search View")
                .tabItem{ Image(selectedTab == .search ? .activeSearch : .inactiveSearch) }
                .tag(Tab.search)
            
            Text("Chat View")
                .tabItem{ Image(selectedTab == .chat ? .activeMessage : .inactiveMessage) }
                .tag(Tab.chat)
            
            CurrentProfile(user: MockData.users[0])
                .tabItem{ Image(selectedTab == .profile ? .activePerson : .inactivePerson) }
                .tag(Tab.profile)
        }
        .tint(.primary)
        
    }
    
}

#Preview {
    MainTabView()
}
