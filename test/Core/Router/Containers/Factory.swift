//
//  Factory.swift
//  test
//
//  Created by Eldar Akkozov on 9/9/25.
//

import Foundation
import SwiftUI

public typealias ScreenBuilder = @MainActor (Router, BundleData?) -> (any View)

public struct Factory {
    
    let registration: FactoryRegistration

    public init(_ container: ManagedContainer, _ key: ScreenKey, _ factory: @escaping ScreenBuilder) {
        self.registration = FactoryRegistration(key, container, factory)
    }

    @MainActor
    public func resolve(_ router: Router, _ bundle: BundleData?) -> (any View) {
        registration.resolve(router, bundle)
    }

    public func register() {
        registration.register(self)
    }
}
