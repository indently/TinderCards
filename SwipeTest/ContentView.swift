//
//  ContentView.swift
//  SwipeTest
//
//  Created by Federico on 06/02/2022.
//

import SwiftUI

struct ContentView: View {
    private var people: [String] = ["Mario", "Luigi", "Peach", "Toad", "Daisy"].reversed()
    
    var body: some View {
        VStack {
            ZStack {
                ForEach(people, id: \.self) { person in
                    CardView(person: person)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
