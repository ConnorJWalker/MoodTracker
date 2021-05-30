//
//  TabBarView.swift
//  MoodTracker
//
//  Created by Connor Walker on 30/05/2021.
//

import SwiftUI

struct TabBarView: View {
    @Binding var selectedTab: Int
    
    private let tabBarIcons = ["book.closed", "chart.pie", "plus.square.fill", "square.grid.3x3", "gearshape"]
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                ForEach(0..<5) { i in
                    Spacer()
                    Button(action: { handleTabClick(i) }, label: {
                        Spacer()
                        if i == 2 {
                            Image(systemName: tabBarIcons[i])
                                .font(.system(size: 44, weight: .bold))
                                .foregroundColor(.accentColour)
                            Spacer()
                        }
                        else {
                            Image(systemName: tabBarIcons[i])
                                .font(.system(size: 24, weight: .bold))
                                .foregroundColor(selectedTab == i ? Color(.label) : .init(white: 0.8))
                            Spacer()
                        }
                    })
                    Spacer()
                }
            }
        }
    }
    
    private func handleTabClick(_ tabNumber: Int) {
        // TODO: handle modal button click
        
        selectedTab = tabNumber
    }
}

struct TabBarView_Previews: PreviewProvider {
    @State static var tab = 0
    
    static var previews: some View {
        TabBarView(selectedTab: $tab)
    }
}
