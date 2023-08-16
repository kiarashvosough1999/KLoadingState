//
//  NotFoundView.swift
//
//
//  Created by Kiarash Vosough on 8/9/23.
//

import SwiftUI

internal struct NotFoundView: View {

    private let message: String
    private let onRetry: (() async -> Void)?

    internal init(message: String, onRetry: (() async -> Void)? = nil) {
        self.message = message
        self.onRetry = onRetry
    }

    @State private var animating: Bool = false


    internal var body: some View {
        VStack {
            Text(message)
                .font(.title3)
                .bold()
                .foregroundColor(.red)
            Button("Retry", action: { Task(operation: { await onRetry?() })})
                .compatibleBorderedButtonStyle()
        }
        .frame(alignment: .center)
        .scaleEffect(animating ? 1.8 : 1)
        .opacity(animating ? 1 : 0.5)
        .animation(
            .spring()
                .delay(0.3)
                .repeatForever(autoreverses: true),
            value: animating
        )
        .onAppear {
            animating.toggle()
        }
    }
}

#if DEBUG
struct NotFoundView_Previews: PreviewProvider {
    static var previews: some View {
        NotFoundView(message: "hi") {}
    }
}
#endif
