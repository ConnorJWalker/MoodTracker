//
//  TabBarView.swift
//  MoodTracker
//
//  Created by Connor Walker on 30/05/2021.
//

import SwiftUI

struct TabBarView: View {
    @Binding var selectedTab: Int
    @Binding var shouldShowModal: Bool
    
    private let tabBarIcons = ["book.closed", "chart.pie", "plus.square.fill", "square.grid.3x3", "gearshape"]
    
    var body: some View {
        VStack {
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
                    .sheet(isPresented: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Is Presented@*/.constant(false)/*@END_MENU_TOKEN@*/, content: {
                        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Content@*/Text("Sheet Content")/*@END_MENU_TOKEN@*/
                    })
                    Spacer()
                }
            }
        }
    }
    
    private func handleTabClick(_ tabNumber: Int) {
        if tabNumber != 2 {
            selectedTab = tabNumber
            return
        }
        
        shouldShowModal.toggle()
    }
}

struct TabBarView_Previews: PreviewProvider {
    @State static var tab = 0
    @State static var shouldShowModal = false
    
    static var previews: some View {
        TabBarView(selectedTab: $tab, shouldShowModal: $shouldShowModal)
    }
}
