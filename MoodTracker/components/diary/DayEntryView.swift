//
//  DayEntry.swift
//  MoodTracker
//
//  Created by Connor Walker on 30/05/2021.
//

import SwiftUI

struct DayEntryView: View {
    @State var isCollapsed = false
    @State var dayEntry: DayEntry
    
    var body: some View {
        VStack {
            HStack {
                Text(formatDateText(dayEntry.date))
                Spacer()
                Image(systemName: "chevron.\(isCollapsed ? "up" : "down")")
                    .onTapGesture { isCollapsed.toggle() }
                    .foregroundColor(.gray.opacity(0.5))
            }
            .font(.title)
            
            if !isCollapsed {
                ForEach(0..<dayEntry.moodEntries.count) { i in
                    MoodEntryView(moodEntry: dayEntry.moodEntries[i])
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .none, alignment: .leading)
                }
                HStack {
                    Text("Today I Felt:")
                        .font(.title2)
                    Text(dayEntry.overallMood)
                        .font(.callout)
                        .foregroundColor(.textLight)
                    Spacer()
                }
                Text(dayEntry.diary)
                    .font(.callout)
                    .foregroundColor(.textLight)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .none, alignment: .leading)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 1))
        .padding(.all, 1)
        .shadow(radius: 2)
    }
    
    private func formatDateText(_ date: Date) -> String {
        let calendar = Calendar.current
        if calendar.isDateInToday(date) {
            return "Today"
        }
        else if calendar.isDateInYesterday(date) {
            return "Yesterday"
        }

        return "TODO: Format"
    }
}

struct DayEntryView_Previews: PreviewProvider {
    static var previews: some View {
        DayEntryView(dayEntry: DayEntry(id: 0, date: Date(), moodEntries: [
            MoodEntry(mood: "Sad", tags: ["Anxious", "Stressed"]),
            MoodEntry(mood: "Happy", tags: ["Loved", "Excited", "Content"])
        ], overallMood: "Happy", diary: "This is a demo diary entry that will have to do for now until I get CoreData set up which is not now but I need dummy data, preferably fairly long for the diary entry to see how it ends up looking"))
        .padding([.leading, .trailing], 10)
    }
}
