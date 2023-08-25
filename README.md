# KLoadingState

![Swift](https://img.shields.io/badge/Swift-5.8-Orange?style=flat-square)
![Platforms](https://img.shields.io/badge/Platforms-macOS_iOS_tvOS_watchOS-Green?style=flat-square)
![SPM](https://img.shields.io/badge/Swift_Package_Manager-compatible-orange?style=flat-square)
[![Twitter](https://img.shields.io/badge/Twitter-@Vosough_k-blue.svg?style=flat-square)](https://twitter.com/vosough_k)
[![Linkedin](https://img.shields.io/badge/Linkedin-KiarashVosough-blue.svg?style=flat-square)](https://www.linkedin.com/in/kiarashvosough/)
![example workflow](https://github.com/kiarashvosough1999/KLoadingState/actions/workflows/iOS.yml/badge.svg)

Simple Loading State Managment for SwiftUI.

This was a repetitive code of my projects, so I created a package to reuse it more easily.

- [Features](#features)
- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [Contributors](#contributors)
- [License](#license)

## Features

- [x] Simplfy Transition Between States Of Loading Async DataSource's States.
- [x] Retry View And Recovery Button On Failure State.
- [x] Custome Message On Failure.

## Requirements

Minimum `swift-tools-version 5.8` is required.

| Platform | Minimum Swift Version | Installation | Status |
| --- | --- | --- | --- |
| iOS 14.0+ | 5.8.1 | [SPM](#cocoapods) | Tested |
| macOS 11.0+ | 5.8.1 | [SPM](#cocoapods) | Tested |
| watchOs 7.0+ | 5.8.1 | [SPM](#cocoapods) | NotTested |
| tvOS 14.0+ | 5.8.1 | [SPM](#cocoapods) | NotTested |

## Installation

### SPM

The [Swift Package Manager](https://www.swift.org/package-manager) is a tool for automating the distribution of Swift code and is integrated into the swift compiler.

Once you have your Swift package set up, adding `KLoadingState` as a dependency is as easy as adding it to the dependencies value of your Package.swift.

```swift
dependencies: [
    .package(url: "https://github.com/kiarashvosough1999/KLoadingState.git", .upToNextMajor(from: "0.0.1"))
]
```
## Usage

Simplfy loading async content with 4 states and show relatable views respectivly.

1. loaded(T)
2. failedToLoad(message: String)
3. notLoaded
4. loading

In case of loading you can create a state of LoadingState<T>(which require the loading content generic) inside your view, viewModel or State(for redux based patterns, insider reducer).

The example below demonsterate declaration of loading state using `ObservableObject`.

```swift
final class ViewModel: ObservableObject {
    @Published var _state: LoadingState<[Entity]> = .notLoaded
}
```

But you can also delcare it on view's structure using `@State`.

```swift
final struct MyView: View {
    @State var _state: LoadingState<[Entity]> = .notLoaded
}
```

To use the state, you must wrap your view inside `WithLoadingState` View. This view handles state 1 to 4, and requires you pass the view to be rendered when the state changes to `.loaded`.

As soon as the state changes to `.loaded`, the closure with view you provided will be rendered with respective datasource passed via `.loaded(..)`.

> you can use `onRetry` modifier to receive callback, if user clicked on retry button when loading's state transit to '.failedToLoad', in order to take some action to retry.

```swift
    var body: some View {
        WithLoadingState(state: _state) { dataSource in
            Some Views....
        }
        .onRetry {
            // Support Async Functions Invocation
            Some Loading Task...
        }
    }
```

## Contributors

Feel free to share your ideas or any other problems. Pull requests are welcomed.

## License

`KLoadingState ` is released under an MIT license. See [LICENSE](https://github.com/kiarashvosough1999/KLoadingState/blob/master/LICENSE) for more information.
