//
//  Habit.swift
//  HabitTracking
//
//  Created by Rishav Gupta on 17/06/23.
//

import Foundation

class Habit: ObservableObject {
    @Published var habits = [HabitItem]() {
        didSet {
            let encoder = JSONEncoder()
            
            if let encoded = try? encoder.encode(habits) {
                UserDefaults.standard.set(encoded, forKey: "Habits")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Habits") {
            if let decodedItems = try? JSONDecoder().decode([HabitItem].self, from: savedItems) {
                habits = decodedItems
                return
            }
        }
        habits = []
    }
}
