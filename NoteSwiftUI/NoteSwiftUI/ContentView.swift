//
//  ContentView.swift
//  NoteSwiftUI
//
//  Created by 김담인 on 2023/03/16.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        List {
            PersonCardView(person: person1)
                .listRowSeparator(.hidden)
            PersonCardView(person: person2)
                .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

