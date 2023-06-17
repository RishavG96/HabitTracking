//
//  Habit.swift
//  HabitTracking
//
//  Created by Rishav Gupta on 17/06/23.
//

import Foundation

struct HabitItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let frequency: String
    var completedTimes: Int = 0
}
