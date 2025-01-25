//
//  AIService.swift
//  HabitBreaker
//
//  Created by Khushi Malik on 25/01/25.
//


import SwiftUI
import Combine

class AIService: ObservableObject {
    @Published var generatedStory: String = ""
    
    func fetchStory(for habit: String) {
        let url = URL(string: "https://api.openai.com/v1/completions")! // Replace with your API endpoint
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("Bearer YOUR_API_KEY", forHTTPHeaderField: "Authorization")  // Set your API Key here
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let prompt = "Write a story to help a person break their habit of \(habit). Give them motivation and strategies to stop."
        
        let body: [String: Any] = [
            "model": "text-davinci-003",  // Replace with the model you are using
            "prompt": prompt,
            "max_tokens": 150
        ]
        
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .prettyPrinted)
        
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            if let data = data, error == nil {
                let result = try? JSONDecoder().decode(APIResponse.self, from: data)
                DispatchQueue.main.async {
                    self?.generatedStory = result?.choices.first?.text ?? "Sorry, no story generated."
                }
            }
        }
        
        task.resume()
    }
}

struct APIResponse: Decodable {
    struct Choice: Decodable {
        let text: String
    }
    
    let choices: [Choice]
}
