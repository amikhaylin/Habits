//
//  AddView.swift
//  Habits
//
//  Created by Andrey Mikhaylin on 30.03.2021.
//

import SwiftUI

struct AddView: View {
    @State private var name = ""
    @State private var description = ""
    @ObservedObject var habits: Habits
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                Section(header: Text("Description")) {
                    TextEditor(text: $description)
                        .padding(.bottom)
                }
            }
            .navigationBarTitle("Add new habit")
            .navigationBarItems(trailing:
                Button("Save") {
                    let item = HabitItem(name: self.name, description: self.description)
                    self.habits.items.append(item)
                    self.presentationMode.wrappedValue.dismiss()
                }
            )
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(habits: Habits())
    }
}
