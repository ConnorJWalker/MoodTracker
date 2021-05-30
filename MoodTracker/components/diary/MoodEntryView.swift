//
//  MoodEntryView.swift
//  MoodTracker
//
//  Created by Connor Walker on 30/05/2021.
//

import SwiftUI

struct MoodEntryView: View {
    @State var moodEntry: MoodEntry
    
    var body: some View {
        HStack {
            Rectangle()
                .fill(Color.gray.opacity(0.5))
                .frame(width: 75, height: 75)
            VStack(alignment: .leading) {
                Text(moodEntry.mood)
                    .font(.title2)
                HStack {
                    ForEach(0..<moodEntry.tags.count) { i in
                        Text(moodEntry.tags[i])
                            .font(.caption)
                            .padding([.leading, .trailing], 10)
                            .padding([.top, .bottom], 3)
                            .background(Color.accentColourOpacity)
                            .foregroundColor(.white)
                            .cornerRadius(5)
                    }
                }
            }
        }
    }
}

struct MoodEntryView_Previews: PreviewProvider {
    static var previews: some View {
        MoodEntryView(moodEntry: MoodEntry(mood: "Happy", tags: ["Loved", "Excited", "Content"]))
            .padding()
    }
}
