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
//  WithLoadingState.swift
//  
//
//  Created by Kiarash Vosough on 8/14/23.
//

import SwiftUI

public struct WithLoadingState<Content, T: Equatable>: View where Content: View {

    private let state: LoadingState<T>
    private let onLoaded: (T) -> Content
    private var onRetry: (() async -> Void)?

    public init(
        state: LoadingState<T>,
        @ViewBuilder onLoaded: @escaping (T) -> Content
    ) {
        self.state = state
        self.onLoaded = onLoaded
    }

    public var body: some View {
        switch state {
        case .loaded(let values):
            onLoaded(values)
        case .loading:
            Spacer()
            ProgressView()
                .scaleEffect(1.5, anchor: .center)
                .progressViewStyle(.circular)
            Spacer()
        case .failedToLoad(let message):
            Spacer()
            NotFoundView(message: message, onRetry: onRetry)
            Spacer()
        case .notLoaded:
            EmptyView()
        }
    }
}

extension WithLoadingState {

    public func onRetry(_ onRetry: @escaping () async -> Void) -> WithLoadingState {
        var mutabelSelf = self
        mutabelSelf.onRetry = onRetry
        return mutabelSelf
    }
}
