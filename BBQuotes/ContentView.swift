//
//  ContentView.swift
//  BBQuotes
//
//  Created by sourav das on 07/07/24.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView{
            Text("Breaking Bad")
                .toolbarBackground(.visible, for: .tabBar)
                .tabItem {
                    Label("Breaking Bad",systemImage: "tortoise")
                }
            
            
            Text("Better call saul")
                .toolbarBackground(.visible, for: .tabBar)
                .tabItem {
                    Label("Better call saul",systemImage: "briefcase.fill")
                }
            
            
            
        }
    }
}

#Preview {
    ContentView()
}
