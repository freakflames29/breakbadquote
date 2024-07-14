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
            QuoteView(show: Constants.bbName)
                .toolbarBackground(.visible, for: .tabBar)
                .tabItem {
                    Label(Constants.bbName,systemImage: "tortoise")
                }
            
            
            QuoteView(show: Constants.bcsName)
                .toolbarBackground(.visible, for: .tabBar)
               
                .tabItem {
                    Label(Constants.bcsName,systemImage: "briefcase.fill")
                }
            
            QuoteView(show: Constants.ecName)
                .toolbarBackground(.visible, for: .tabBar)
                .tabItem {
                    Label(Constants.ecName,systemImage: "car")
                }
            
            
            
        }
    }
}

#Preview {
    ContentView()
}
