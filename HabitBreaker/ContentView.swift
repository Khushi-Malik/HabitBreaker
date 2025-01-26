import SwiftUI

struct ContentView: View {
    @State private var habits: [Habit] = []// The list of habits user added
    @State private var selectedHabit: Habit? = nil // Currently selected habit
    @State private var showAddHabitView = false
    @AppStorage("hasSeenIntro") private var hasSeenIntro: Bool = false // Tracks user's first entry
    @State private var isTextVisible = false // Controls fade-in animation
    @State private var introText = "Every day, millions of people fall short of their resolutions to break bad habits."
    
    var body: some View {
        NavigationStack {
            VStack {
                TitleView()
                
                Spacer()
                
                if !hasSeenIntro {
                    IntroView(introText: $introText, isTextVisible: $isTextVisible, hasSeenIntro: $hasSeenIntro)
                } else {
                    HabitDashboardView(habits: $habits, showAddHabitView: $showAddHabitView)
                }
            }
        }
    }
}

struct TitleView: View {
    var body: some View {
        Text("HabitBreaker.")
            .font(.title)
            .padding()
    }
}

struct IntroView: View {
    @Binding var introText: String
    @Binding var isTextVisible: Bool
    @Binding var hasSeenIntro: Bool
    
    var body: some View {
        ZStack {
            Text(introText)
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
                        introText = "You've just conquered the hardest part—the decision to quit.\nCongratulations! You're already on the path to transformation."
                        hasSeenIntro = true
                    }
                }
        }
        .padding(40)
    }
}

struct HabitDashboardView: View {
    @Binding var habits: [Habit]
    @Binding var showAddHabitView: Bool
    
    var body: some View {
        VStack {
            if !habits.isEmpty {
                HabitsScrollView(habits: [Habit])
            } else {
                EmptyHabitsView()
            }
            
            Spacer()
            
            AddHabitButton(showAddHabitView: $showAddHabitView, habits: $habits)
        }
    }
}

struct EmptyHabitsView: View {
    var body: some View {
        Text("No habits added yet. Begin your journey to self-improvement now!")
            .font(.subheadline)
            .foregroundColor(.gray)
            .padding()
            .multilineTextAlignment(.center)
    }
}

struct HabitsScrollView: View {
    @Binding var habits: [Habit]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 5) {
                ForEach(habits) { habit in
                    NavigationLink(destination: HabitView(habit: Habit)) {
                        HabitCardView(habit: habit)
                    }
                }
            }
            .padding()
        }
    }
}

struct HabitCardView: View {
    let habit: Habit
    
    var body: some View {
        VStack {
            Text(habit.name) // Habit name
                .font(.headline)
                .padding(.bottom, 5)
            if habit.level > 0 {
                HStack{
                    ForEach(1...habit.level, id: \.self) { day in
                        ZStack {
                            // Black and white circle
                            Circle()
                                .strokeBorder(Color.black, lineWidth: 2)
                                .background(Circle().fill(Color.white))
                                .frame(width: 40, height: 40)
                            
                            Text("\(day)") // Display level number
                                .font(.title2)
                                .foregroundColor(.black)
                            
                            // Fire emoji for streak
                            if day == habit.level { // Highlight current streak
                                Text("🔥")
                                    .offset(y: -20) // Adjust position
                                    .font(.title2)
                            }
                        }
                    }
                }
            } else {
                // No Progress Message
                Text("No progress yet")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.black, lineWidth: 2)
        )
        .padding(.horizontal)
    }
}



struct AddHabitButton: View {
    @Binding var showAddHabitView: Bool
    @Binding var habits: [Habit]
    
    var body: some View {
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
            AddHabitView(habits: $habits) // Replace with actual binding
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
