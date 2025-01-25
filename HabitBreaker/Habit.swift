//
//  Habit.swift
//  HabitBreaker
//
//  Created by Khushi Malik on 25/01/25.
//
import SwiftUI


struct Habit: Identifiable {
    let id = UUID() // Unique identifier for each habit
    // ^might not need this
    var name: String // Name of the habit
    var level: Int // Current level or progress of the habit
    // ^ days
    var log: [Date] // Log of dates whenever the habit is triggered
    var milestones: [Int]
    // ^ important milestones that are passed for special motivation
}

