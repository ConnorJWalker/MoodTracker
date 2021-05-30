//
//  ContentView.swift
//  MoodTracker
//
//  Created by Connor Walker on 29/05/2021.
//

import SwiftUI

struct ContentView: View {
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    @State var selectedTab = 0
    @State var shouldShowModal = false
    
    var body: some View {
        ZStack {
            VStack {
                TabView(selection: $selectedTab) {
                    DiaryScreen()
                        .tabItem {
                            Image(systemName: "book.closed")
                        }
                        .tag(0)
                    Text("Overview Page")
                        .tabItem {
                            Image(systemName: "chart.pie")
                        }
                        .tag(1)
                    Text("Pixels Page")
                        .tabItem {
                            Image(systemName: "square.grid.3x3")
                        }
                        .tag(3)
                    Text("Settings Page")
                        .tabItem {
                            Image(systemName: "gearshape")
                        }
                        .tag(5)
                }
                
                TabBarView(selectedTab: $selectedTab, shouldShowModal: $shouldShowModal)
            }
            
            MoodEntryModal(shouldShowModal: $shouldShowModal)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
