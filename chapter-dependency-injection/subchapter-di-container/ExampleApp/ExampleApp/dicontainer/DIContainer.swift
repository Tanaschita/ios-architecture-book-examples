//
//  DIContainer.swift
//  ExampleApp
//
//  Created by Natascha Fadeeva on 01.09.25.
//

import Foundation

public enum DependencyLifetime {
    case singleton
    case transient
}

public class DIContainer {
    static let shared = DIContainer()
    
    private var factories: [String: Any] = [:]
    private var singletons: [String: Any] = [:]
    private var lifetimes: [String: DependencyLifetime] = [:]
    
    private init() {}
    
    func register<T>(_ type: T.Type, factory: @escaping () -> T, lifetime: DependencyLifetime = .transient) {
        let key = String(describing: type)
        factories[key] = factory
        lifetimes[key] = lifetime
    }
    
    func resolve<T>(_ type: T.Type) -> T? {
        let key = String(describing: type)
        guard let lifetime = lifetimes[key] else { return nil }
        
        switch lifetime {
        case .transient:
            guard let factory = factories[key] as? () -> T else { return nil }
            return factory()
        case .singleton:
            if let instance = singletons[key] as? T { return instance }
            guard let factory = factories[key] as? () -> T else { return nil }
            let instance = factory()
            singletons[key] = instance
            return instance
        }
    }
}

@propertyWrapper
public struct Injected<T> {
    private var dependency: T
    
    public init() {
        guard let dependency = DIContainer.shared.resolve(T.self) else {
            fatalError("No dependency registered for \(T.self)")
        }
        self.dependency = dependency
    }
    
    public var wrappedValue: T {
        return dependency
    }
}
