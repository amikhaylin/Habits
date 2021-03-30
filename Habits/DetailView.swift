//
//  DetailView.swift
//  Habits
//
//  Created by Andrey Mikhaylin on 30.03.2021.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var habits: Habits
    var index: Int
    
    var body: some View {
        GeometryReader { geometry in
           VStack {
            Text("\(habits.items[index].amount)")
                    .fontWeight(.bold)
                    .font(.largeTitle)

            Text(habits.items[index].description)
                .padding(.top, 20.0)
                Spacer()
            Button(action: {
                habits.items[index].amount += 1
            }, label: {
                    Image(systemName: "plus")
                        .resizable()
                        .padding(5)
                        
            })
            .frame(width: 50, height: 50, alignment: .center)
            .foregroundColor(.white)
            .background(Color.green)
            .cornerRadius(25.0)
            }
           .frame(width: geometry.size.width)
        }
        .navigationBarTitle(Text(habits.items[index].name), displayMode: .inline)
    }
    
    init(habits: Habits, habit: HabitItem) {
        self.habits = habits
        
        if let index = habits.items.firstIndex(where: { $0.id == habit.id })  {
            self.index = index
        } else {
            self.index = 0
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(habits: Habits(), habit: HabitItem(name: "Test", description: "Test test test"))
    }
}
