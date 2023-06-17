//
//  AddHabit.swift
//  HabitTracking
//
//  Created by Rishav Gupta on 17/06/23.
//

import SwiftUI

struct AddHabit: View {
    @ObservedObject var habitObject: Habit
    @Environment(\.dismiss) var dismiss
    
    @State private var name: String = ""
    @State private var frequency: String = ""
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Enter Habit Name", text: $name)
                
                TextField("Enter Habit Freq to achieve per day", text: $frequency)
            }
            .navigationTitle("Add New Habit")
            .toolbar {
                Button("Save") {
                    let newHabit = HabitItem(name: name, frequency: frequency)
                    habitObject.habits.append(newHabit)
                    dismiss()
                }
            }
        }
    }
}

struct AddHabit_Previews: PreviewProvider {
    static var previews: some View {
        AddHabit(habitObject: Habit())
    }
}
