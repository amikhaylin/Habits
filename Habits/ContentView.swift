//
//  ContentView.swift
//  Habits
//
//  Created by Andrey Mikhaylin on 30.03.2021.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var habits = Habits()
    @State private var showingAddHabit = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(habits.items) { item in
                    NavigationLink(
                        destination: DetailView(habits: self.habits, habit: item),
                        label: {
                            Text(item.name)
                                .font(.headline)
                        })
                }
                .onDelete(perform: removeItems)
            }
            .navigationBarTitle("Habits")
            .navigationBarItems(leading: EditButton(),
                                trailing: Button(action: {
                                    self.showingAddHabit = true
                                }, label: {
                                    Image(systemName: "plus")
                                }))
        }
        .sheet(isPresented: $showingAddHabit, content: {
            AddView(habits: self.habits)
        })
    }
    
    func removeItems(at offsets: IndexSet) {
        habits.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
