//
//  Habit.swift
//  Habits
//
//  Created by Andrey Mikhaylin on 30.03.2021.
//

import Foundation

struct HabitItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let description: String
    var amount: Int = 0
}

class Habits: ObservableObject {
    @Published var items = [HabitItem]() {
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let items = UserDefaults.standard.data(forKey: "Items") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([HabitItem].self, from: items) {
                self.items = decoded
                return
            }
        }
    }
}

