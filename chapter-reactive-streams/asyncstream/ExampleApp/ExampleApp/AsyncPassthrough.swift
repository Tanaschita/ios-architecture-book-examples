//
//  AsyncPassthrough.swift
//  ExampleApp
//
//  Created by Natascha Fadeeva on 05.11.25.
//

import Foundation

actor AsyncPassthrough<Value> {
    private var continuations: [UUID: AsyncStream<Value>.Continuation] = [:]

    func stream() -> AsyncStream<Value> {
        let id = UUID()
        return AsyncStream { continuation in
            continuations[id] = continuation
            continuation.onTermination = { [weak self] _ in
                Task { await self?.removeContinuation(id) }
            }
        }
    }

    func send(_ value: Value) {
        for continuation in continuations.values {
            continuation.yield(value)
        }
    }

    private func removeContinuation(_ id: UUID) {
        continuations[id] = nil
    }
}
