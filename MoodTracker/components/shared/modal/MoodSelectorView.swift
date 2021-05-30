//
//  MoodSelectorView.swift
//  MoodTracker
//
//  Created by Connor Walker on 30/05/2021.
//

import SwiftUI

struct MoodSelectorView: View {
    private let avaiableEmotions = ["Angry", "Sad", "Meh", "Happy", "Excited"]
    
    var body: some View {
        HStack {
            ForEach(0..<avaiableEmotions.count) { i in
                Spacer()
                VStack {
                    Image(systemName: "face.smiling")
                        .redacted(reason: /*@START_MENU_TOKEN@*/.placeholder/*@END_MENU_TOKEN@*/)
                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                    Text(avaiableEmotions[i])
                        .font(.callout)
                }
                Spacer()
            }
        }
    }
}
