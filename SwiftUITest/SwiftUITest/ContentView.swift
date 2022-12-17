//
//  ContentView.swift
//  SwiftUITest
//
//  Created by Evren Akgün on 6.12.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack { // VStack içine yazmazsan başka bir simulatörde gösterir.
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.green)
            Text("Hello, SwiftUI!")
                .padding()
            Spacer()
            Text("Hello")
                .foregroundColor(.blue)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
