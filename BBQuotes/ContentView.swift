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
            QuoteView(show: "Breaking Bad")
                .toolbarBackground(.visible, for: .tabBar)
                .tabItem {
                    Label("Breaking Bad",systemImage: "tortoise")
                }
            
            
            QuoteView(show: "Better Call Saul")
                .toolbarBackground(.visible, for: .tabBar)
                .tabItem {
                    Label("Better call saul",systemImage: "briefcase.fill")
                }
            
            QuoteView(show: "El Camino")
                .toolbarBackground(.visible, for: .tabBar)
                .tabItem {
                    Label("El Camnio",systemImage: "car")
                }
            
            
            
        }
    }
}

#Preview {
    ContentView()
}
