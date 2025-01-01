//
//  HabitView.swift
//  HabitBreaker
//
//  Created by Khushi Malik on 23/12/24.
//

import SwiftUI

struct HabitView: View {
    var body: some View {
        NavigationStack {
            ZStack{
                HStack{
                    Button {
                        print("Add Habit tapped")
                    } label: {
                        Text("Notifications")
                            .padding()
                            .foregroundStyle(.black)
                            .background(Color(hue: 0.449, saturation: 0.366, brightness: 0.985, opacity: 0.535))
                            .cornerRadius(10)
                    }
                }
            }
        }
    }
}


#Preview {
    HabitView()
}
