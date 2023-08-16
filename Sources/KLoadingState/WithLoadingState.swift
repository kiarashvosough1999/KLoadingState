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
