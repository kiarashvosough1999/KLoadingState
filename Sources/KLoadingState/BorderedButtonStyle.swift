//  MIT License
//
//  Copyright (c) 2023 Kiarash Vosough
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
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
