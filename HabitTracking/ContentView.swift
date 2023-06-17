//
//  ContentView.swift
//  HabitTracking
//
//  Created by Rishav Gupta on 17/06/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var habitObject = Habit()
    
    @State private var showingAddHabit = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(habitObject.habits) { habit in
                    NavigationLink {
                        HabitLogging(habitItem: habit, habitObject: habitObject)
                    } label: {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(habit.name)
                                
                                Text("Every day: \(habit.frequency)")
                            }
                            Text("      Completed: \(habit.completedTimes)")
                        }
                    }
                }
                .onDelete { indexSet in
                    habitObject.habits.remove(atOffsets: indexSet)
                }
            }
            .navigationTitle("Habit Tracking")
            .toolbar {
                Button {
                    showingAddHabit = true
                } label: {
                    Image(systemName: "plus")
                }
                
                EditButton()
            }
            .sheet(isPresented: $showingAddHabit) {
                AddHabit(habitObject: habitObject)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
