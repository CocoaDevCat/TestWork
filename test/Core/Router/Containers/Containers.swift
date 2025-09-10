//
//  Container.swift
//  test
//
//  Created by Eldar Akkozov on 9/9/25.
//

import Foundation
import SwiftUI

public final class Container: ManagedContainer {

    public static let shared = Container()
    public let manager: ContainerManager = ContainerManager()

    func getFactory(_ key: ScreenKey) -> Factory? {
        return manager.factoryRegistrations[FactoryKey((any View).self, key)]
    }
}

extension ManagedContainer {

    @inline(__always)
    public func callAsFunction(key: ScreenKey, _ factory: @escaping (Router, BundleData?) -> AnyView) -> Factory {
        Factory(self, key, factory)
    }

    @discardableResult
    public func with(_ transform: (Self) -> Void) -> Self {
        transform(self)
        return self
    }
}

public protocol ManagedContainer: AnyObject {
    var manager: ContainerManager { get }
}
