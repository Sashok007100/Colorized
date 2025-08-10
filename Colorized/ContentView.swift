//
//  ContentView.swift
//  Colorized
//
//  Created by Alexandr Artemov (Mac Mini) on 09.08.2025.
//

import SwiftUI

struct ContentView: View {
    
    @State private var redValue = Double.random(in: 0...255)
    @State private var greenValue = Double.random(in: 0...255)
    @State private var blueValue = Double.random(in: 0...255)
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        ZStack {
            Color(#colorLiteral(red: 0, green: 0.2921561163, blue: 0.6085549857, alpha: 1)).ignoresSafeArea()
                Spacer()
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
