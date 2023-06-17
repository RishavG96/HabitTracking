//
//  HabitLogging.swift
//  HabitTracking
//
//  Created by Rishav Gupta on 17/06/23.
//

import SwiftUI

struct Square: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        
        
        return path
    }
}

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        
        return path
    }
}

struct Line: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.minX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        
        return path
    }
}

struct HabitLogging: View {
    var habitItem: HabitItem
    @ObservedObject var habitObject: Habit
    
    @State private var habitTracker = 0.0
    @State private var completed: Int = 0
    
    var body: some View {
        Form {
            Section {
                Text("You had targeted to do \(habitItem.name) for \(habitItem.frequency)")
                    .font(.title)
                    .bold()
                    .foregroundColor(.green)
                
                
                Text("How much of it were you able to achieve it?")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.gray)
            }
            
            Section {
                Stepper("Completed count: \(completed)", value: $completed)
                    .bold()
                    .font(.title2)
            }
            
            Section {
                switch completed {
                case 1 :
                    Circle()
                        .stroke(.gray)
                case 2:
                    Line()
                        .stroke(.gray)
                        .frame(width: 300, height: 300)
                case 3:
                    Triangle()
                        .stroke(.gray)
                        .frame(width: 300, height: 300)
                case 4:
                    Square()
                        .stroke(.gray)
                        .frame(width: 300, height: 300)
                case 5, 6, 7, 8, 9, 10:
                    Text("hehe 😅 enough")
                        .frame(width: 300, height: 300)
                default:
                    Circle()
                        .stroke(.white)
                }
            }
        }
        .navigationBarTitle(Text("Set Habit Log"), displayMode: .inline)
        Button("Submit") {
            if let foundIndex = habitObject.habits.firstIndex(where: { $0.id == habitItem.id }) {
                habitObject.habits[foundIndex].completedTimes += completed
            }
        }
    }
}

struct HabitLogging_Previews: PreviewProvider {
    static var previews: some View {
        HabitLogging(habitItem: HabitItem(name: "exercise", frequency: "1 hour"),
        habitObject: Habit())
    }
}
