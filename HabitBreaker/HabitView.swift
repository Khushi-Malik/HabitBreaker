//
//  HabitView.swift
//  HabitBreaker
//
//  Created by Khushi Malik on 25/01/25.
//
import SwiftUI

struct HabitView: View {
    @Binding var habit: Habit
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(habit.name)
                .font(.headline)
                .padding(.bottom, 5)
        }
    }
}
