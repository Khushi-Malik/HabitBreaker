//
//  AddHabitView.swift
//  HabitBreaker
//
//  Created by Khushi Malik on 25/01/25.
//
import SwiftUI

struct AddHabitView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var habits: [Habit] // The list of added habits for the user
    @State private var habitName: String = ""

    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter habit name", text: $habitName)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                Button(action: { // changed the level to 1 from 0
                    let newHabit = Habit(name: habitName, level: 1, log: [], milestones: [])
                    habits.append(newHabit)
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Add Habit")
                        .padding()
                        .background(Color.black)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()

                Spacer()
            }
            .navigationTitle("Add New Habit")
            .padding()
        }
    }
}
