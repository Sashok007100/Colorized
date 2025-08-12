//
//  ColorDisplayView.swift
//  Colorized
//
//  Created by Alexandr Artemov (Mac Mini) on 12.08.2025.
//

import SwiftUI

struct ColorDisplayView: View {
    
    let redValue: Double
    let greenValue: Double
    let blueValue: Double
    
    var body: some View {
        Color(red: redValue / 255, green: greenValue / 255, blue: blueValue / 255)
            .clipShape(.rect(cornerRadius: 20))
            .frame(height: 130)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(.white, lineWidth: 4)
            )
    }
}

#Preview {
    ZStack {
        Color.background
        ColorDisplayView(redValue: 20, greenValue: 50, blueValue: 200)
    }
}
