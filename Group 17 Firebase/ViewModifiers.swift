//
//  ViewModifiers.swift
//  Group 17 Firebase
//
//  Created by Tung Tran Thanh on 12/09/2023.
//

import SwiftUI

struct CustomRoundedBorderTextFieldStyle: TextFieldStyle {
    @ScaledMetric(wrappedValue: 34) private var textFieldHeightNoPad
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        let textFieldHeight = textFieldHeightNoPad + 14
        ZStack {
            RoundedRectangle(cornerRadius: 4)
                .stroke(Color(.lightGray))
                .frame(maxWidth: .infinity, maxHeight: textFieldHeight)
            
            configuration
                .padding([.horizontal], 7)
        }
    }
}

struct ButtonSize: ViewModifier {
    @ScaledMetric(wrappedValue: 34) private var buttonHeight
    
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: buttonHeight)
    }
}
