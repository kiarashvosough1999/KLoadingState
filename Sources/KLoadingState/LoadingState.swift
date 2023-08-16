//
//  LoadingState.swift
// 
//
//  Created by Kiarash Vosough on 8/9/23.
//

import SwiftUI

public enum LoadingState<T> {

    case loaded(T)
    case failedToLoad(message: String)
    case notLoaded
    case loading

    public func map<S>(_ transform: (T) -> S) -> LoadingState<S> {
        switch self {
        case .loaded(let values):
            return .loaded(transform(values))
        case .failedToLoad(let message):
            return .failedToLoad(message: message)
        case .notLoaded:
            return .notLoaded
        case .loading:
            return .loading
        }
    }
}

extension LoadingState: Equatable where T: Equatable {}
