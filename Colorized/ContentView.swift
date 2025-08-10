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
        ZStack {
            Color(#colorLiteral(red: 0, green: 0.2921561163, blue: 0.6085549857, alpha: 1)).ignoresSafeArea()
            
            VStack {
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
                .toolbar{
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        Button("Done") {
                            endEditing()
                        }
                    }
                }
                
                Spacer()
            }
        }
        .onTapGesture {
            endEditing()
        }
    }
}

extension View {
    func endEditing() {
        UIApplication.shared.sendAction(
            #selector(UIResponder.resignFirstResponder),
            to: nil,
            from: nil,
            for: nil
        )
        
    }
}

#Preview {
    ContentView()
}

struct ColorSettingView: View {
    
    let colorSlider: Color
    
    @State private var tempValue: Double = 0
    @FocusState private var isEditing: Bool
    
    @Binding var value: Double
    
    var body: some View {
        HStack(spacing: 16) {
            Text(lround(value).formatted())
                .frame(width: 35, alignment: .leading)
                .foregroundStyle(.white)
            Slider(value: $value, in: 0...255, step: 1)
                .tint(colorSlider)
                .animation(.easeInOut(duration: 0.3), value: value)
            TextField("", value: $tempValue, format: .number.precision(.fractionLength(0)))
                .frame(width: 50)
                .keyboardType(.numberPad)
                .textFieldStyle(.roundedBorder)
                .colorScheme(.light)
                .focused($isEditing)
                .onAppear {
                    tempValue = value
                }
                .onChange(of: isEditing) { oldValue, newValue in
                    if newValue {
                        tempValue = value
                    } else {
                        value = tempValue
                    }
                }
                .onChange(of: value) { _, newValue in
                    if !isEditing {
                        tempValue = newValue
                    }
                }
        }
        .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
    }
}

struct ColorDisplayView: View {
    
    let redValue: Double
    let greenValue: Double
    let blueValue: Double
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(
                Color(
                    red: redValue/255,
                    green: greenValue/255,
                    blue: blueValue/255
                )
            )
            .frame(height: 150)
            .overlay {
                RoundedRectangle(cornerRadius: 20)
                    .stroke(.white, lineWidth: 4)
            }
            .padding(
                EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16)
            )
    }
}
