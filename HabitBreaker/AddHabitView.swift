//
//  AddHabitView.swift
//  HabitBreaker
//
//  Created by Khushi Malik on 25/01/25.
//
import SwiftUI

struct AddHabitView: View {
    @Binding var habits: [Habit]
    @Environment(\.dismiss) var dismiss
    @State private var habitName: String = ""
    
    var body: some View {
        VStack {
            Text("Add a New Habit")
                .font(.headline)
                .padding()
            
            TextField("Enter habit name", text: $habitName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button(action: {
                if !habitName.isEmpty { // changed level to 1
                    let newHabit = Habit(name: habitName, level: 1, log: [], milestones: [])
                    habits.append(newHabit)
                    dismiss()
                }
            }) {
                Text("Add Habit")
                    .padding()
                    .background(Color.black)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
        }
        .padding()
    }
}
