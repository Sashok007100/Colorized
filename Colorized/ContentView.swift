//
//  ContentView.swift
//  Colorized
//
//  Created by Alexandr Artemov (Mac Mini) on 09.08.2025.
//

import SwiftUI

struct ContentView: View {
    
    @State private var redValue = Double.random(in: 0...255).rounded()
    @State private var greenValue = Double.random(in: 0...255).rounded()
    @State private var blueValue = Double.random(in: 0...255).rounded()
    
    @FocusState private var isEditing: Bool
    
    var body: some View {
        ZStack {
            VStack(spacing: 40) {
                ColorDisplayView(
                    redValue: redValue,
                    greenValue: greenValue,
                    blueValue: blueValue
                )
                
                VStack {
                    ColorSettingView(colorSlider: .red, value: $redValue)
                    ColorSettingView(colorSlider: .green, value: $greenValue)
                    ColorSettingView(colorSlider: .blue, value: $blueValue)
                }
                .frame(height: 150)
                .focused($isEditing)
                .toolbar{
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        Button("Done") {
                            isEditing = false
                        }
                    }
                }
                
                Spacer()
            }
        }
        .padding()
        .background(Color.background)
        .onTapGesture {
            isEditing = false
        }
    }
}

#Preview {
    ContentView()
}
