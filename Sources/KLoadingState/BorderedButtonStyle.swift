//
//  BorderedButtonStyle.swift
//  
//
//  Created by Kiarash Vosough on 8/14/23.
//

import SwiftUI

extension View {
    
    @ViewBuilder
    func compatibleBorderedButtonStyle() -> some View {
        if #available(iOS 15.0, *) {
            self
                .tint(.green)
                .buttonStyle(.bordered)
                .buttonBorderShape(.roundedRectangle)
        } else {
            self.buttonStyle(.compatibleBordered)
        }
    }
}

extension ButtonStyle where Self == BorderedButtonStyle {
    static var compatibleBordered: BorderedButtonStyle { BorderedButtonStyle() }
}

struct BorderedButtonStyle: ButtonStyle {

    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .foregroundColor(.green)
            .padding(.all, 8)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .foregroundColor(.green.opacity(0.2))
            )
    }
}
