//
//  TextFieldView.swift
//  Colorized
//
//  Created by Alexandr Artemov (Mac Mini) on 12.08.2025.
//

import SwiftUI

struct TextFieldView: View {
    @Binding var text: String
    
    let action: () -> Void
    
    var body: some View {
        TextField("0", text: $text) { _ in
            withAnimation {
                action()
            }
        }
        .frame(width: 55, alignment: .trailing)
        .multilineTextAlignment(.trailing)
        .textFieldStyle(.roundedBorder)
        .keyboardType(.numberPad)
        .colorScheme(.light)
    }
}

#Preview {
    ZStack {
        Color.background
        TextFieldView(text: .constant("255"), action: {})
    }
}
