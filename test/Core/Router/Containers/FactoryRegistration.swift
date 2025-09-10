//
//  FactoryRegistration.swift
//  test
//
//  Created by Eldar Akkozov on 9/9/25.
//

import Foundation
import SwiftUI

public class FactoryRegistration {

    public let key: FactoryKey
    
    weak var container: ManagedContainer?
    var factory: ScreenBuilder

    internal init(_ key: ScreenKey, _ container: ManagedContainer, _ factory: @escaping ScreenBuilder) {
        self.key = FactoryKey((any View).self, key)
        self.container = container
        
        self.factory = factory
    }

    @MainActor
    internal func resolve(_ router: Router, _ bundle: BundleData?) -> (any View) {
        factory(router, bundle)
    }

    internal func register(_ factory: Factory) {
        container?.manager.factoryRegistrations[key] = factory
    }

}
