//
//  ContentView.swift
//  HabitBreaker
//
//  Created by Khushi Malik on 22/12/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            
            ZStack {
                
                VStack() {
                    Text("HabitBreaker.")
                        .font(.title)
                    
                    HStack(){
                        
                        NavigationLink(destination: NotificationsView()) {
                            Image(systemName: "bell")
                                .resizable()
                                .foregroundColor(Color.black)
                                .frame(width: 30, height: 30)
                                .padding()
                        }
                                
                        NavigationLink(destination: JournalView()){
                            Image(systemName: "message")
                                .resizable()
                                .foregroundColor(Color.black)
                                .frame(width: 30, height: 30)
                        }
                        Spacer()
                        Spacer()
                            
                        NavigationLink(destination: HabitView()){
                                Image(systemName: "circle.fill")
                                    .resizable()
                                    .foregroundColor(Color.red)
                                    .frame(width: 50, height: 50)
                        }
                        .padding()
                    }
                    GeometryReader { geometry in
                        ZStack{
                            NavigationLink(destination: ProgressView()) {
                                Image(systemName: "rectangle.fill")
                                    .resizable()
                                    .foregroundColor(Color.orange)
                                    .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.5)
                                    .padding([.leading, .trailing], 20)
                            }
                            
                            Image(systemName: "calendar")
                                .resizable()
                                .scaledToFit()
                                .frame(width: geometry.size.width * 0.15, height: geometry.size.height * 0.15)
                                .foregroundColor(.black)
                        }
                        Spacer()
                    }
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
