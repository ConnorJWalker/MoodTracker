//
//  DiaryScreen.swift
//  MoodTracker
//
//  Created by Connor Walker on 30/05/2021.
//

import SwiftUI

// TODO: remove this temp code
extension Date {
    static var yesterday: Date { return Date().dayBefore }
    static var tomorrow:  Date { return Date().dayAfter }
    var dayBefore: Date {
        return Calendar.current.date(byAdding: .day, value: -1, to: noon)!
    }
    var dayAfter: Date {
        return Calendar.current.date(byAdding: .day, value: 1, to: noon)!
    }
    var noon: Date {
        return Calendar.current.date(bySettingHour: 12, minute: 0, second: 0, of: self)!
    }
    var month: Int {
        return Calendar.current.component(.month,  from: self)
    }
    var isLastDayOfMonth: Bool {
        return dayAfter.month != month
    }
}

// TODO: move temp structs into a models
struct MoodEntry {
    public var mood: String
    public var tags: [String]
}

struct DayEntry: Hashable {
    var id: Int
    public let date: Date
    public var moodEntries: [MoodEntry]
    public var overallMood: String
    public var diary: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(date)
    }
    
    static func ==(lhs: DayEntry, rhs: DayEntry) -> Bool {
        return lhs.id == rhs.id
    }
}

struct DiaryScreen: View {
    // TODO: load from storage instead of hardcode
    @State var dayEntries = [
            DayEntry(id: 0, date: Date(), moodEntries: [
                    MoodEntry(mood: "Sad", tags: ["Anxious", "Stressed"]),
                    MoodEntry(mood: "Happy", tags: ["Loved", "Excited", "Content"])
                ], overallMood: "Happy", diary: "This is a demo diary entry that will have to do for now until I get CoreData set up which is not now but I need dummy data, preferably fairly long for the diary entry to see how it ends up looking"),
            DayEntry(id: 1, date: Date.yesterday, moodEntries: [
                    MoodEntry(mood: "Sad", tags: ["Anxious", "Stressed"])
                ], overallMood: "Happy", diary: "This is a hardcoded short diary entry for yesterday")
        ]
    
    var body: some View {
        NavigationView {
            VStack {
                // TODO: add filter dropdown here
                ScrollView {
                    ForEach(dayEntries, id: \.self) { dayEntry in
                        // TODO: move to own component
                        DayEntryView(dayEntry: dayEntry)
                    }
                }
                .padding([.leading, .trailing], 10)
            }
            .navigationTitle("Diary")
            .background(Color(red: 0.98, green: 0.98, blue: 0.98))
        }
    }
}

struct DiaryScreen_Previews: PreviewProvider {
    static var previews: some View {
        DiaryScreen()
    }
}
