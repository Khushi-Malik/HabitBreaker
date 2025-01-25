import SwiftUI

struct ContentView: View {
    
    @State private var habits: [Habit] = [] // The list of habits user added
    @State private var selectedHabit: Habit? = nil // Currently selected habit
//    @State private var journalText: String = ""
    @State private var showAddHabitView = false
    
    @AppStorage("hasSeenIntro") private var hasSeenIntro: Bool = false  // track user's first entry
    @State private var isTextVisible = false  // fade-in animation
    @State private var firsttimetext = "Every day, millions of people fall short of their resolutions to break bad habits."
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack {
                    Text("HabitBreaker.")
                        .font(.title)
                }
                
                Spacer()
                
                if !hasSeenIntro { // First time welcome
                    ZStack {
                        Text(firsttimetext)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .opacity(isTextVisible ? 1 : 0)
                            .onAppear {
                                withAnimation(.easeIn(duration: 3)) {
                                    isTextVisible = true
                                }
                            }
                            .onTapGesture {
                                withAnimation(.easeInOut(duration: 1)) {
                                    firsttimetext = "You've just conquered the hardest part, the decision to quit.\nCongratulations—you're already on the path to transformation!"
                                }
                                hasSeenIntro = true
                            }
                    }
                    .padding([.trailing, .leading], 40)
                } else { // Regular Dashboard
                        NavigationStack {
                            // Level Progression View
                            // Horizontal scrolling view for all habits that the user has
                            
                            
                            // Habit Pane, have this specifically here always
                            
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 20) {
                                    ForEach(habits) { habit in
                                        VStack {
                                            Text(habit.name) // name of habit first
                                                .font(.headline)
                                            
                                            HStack { // need a lot more checks
                                                // lets the used make habits with no name, and then the progress should start with 1.
                                                // Add Habit should be at the top, beside the trigger button.
                                                if habit.level > 0 {
                                                    // add this inside a fire symbol
                                                    ForEach(1...habit.level, id: \.self) { day in
                                                        Text("\(day)")
                                                            .font(.title2)
                                                            .foregroundColor(.blue)
                                                    }
                                                } else { // need something else here
                                                    Text("No progress yet")
                                                        .font(.subheadline)
                                                        .foregroundColor(.gray)
                                                }
                                            }
                                        }
                                        .padding()
                                        .background(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(Color.black, lineWidth: 2)
                                        )
                                    }
                                }
                                .padding()
                            }
                            
                            // Journal Section-- has gots to be more creative. and should be a button. the knowledge base for AI bot should be this, the triggers, the extra knowledge bases for good habit breaking that i give.
                            
                            // Should be a button, with a notebook view.
                            Text("Journal")
                                .font(.title2)
                                .padding(.top)
                            
//                            TextEditor(text: $journalText)
//                                .frame(height: 200)
//                                .border(Color.black, width: 2)
//                                .padding()
                            
                            // Trigger Log Button
//                            if let habit = selectedHabit {
//                                Button(action: {
//                                    logTrigger(for: habit)
//                                }) {
//                                    Text("Log Trigger")
//                                        .padding()
//                                        .background(Color.black)
//                                        .foregroundColor(.white)
//                                        .cornerRadius(10)
//                                }
//                                .padding()
//                            }
                            
                            Spacer()
                            
                            // Add New Habit Button
                            Button(action: {
                                showAddHabitView = true
                            }) {
                                Text("Add New Habit")
                                    .padding()
                                    .background(Color.black)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                            }
                            .sheet(isPresented: $showAddHabitView) {
                                AddHabitView(habits: $habits)
                            }
                            .padding()
                        }
                    }
                }
        }
    }
}
                            

#Preview {
    ContentView()
}

func logTrigger(habits: [Habit]) {
//    ForEach (habits) {habit in
//        // finish the log trigger logic
////        habit.log.append(Date())
//    }
}
