import SwiftUI

struct ContentView: View {
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
                
                if !hasSeenIntro {
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
                } else {
                    ZStack{
                        HStack{
                            
                        }
                    }
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}
