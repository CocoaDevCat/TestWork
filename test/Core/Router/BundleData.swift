//
//  BundleData.swift
//  test
//
//  Created by Eldar Akkozov on 9/9/25.
//

import Foundation

public class BundleData {

    private var data: [String: Any] = [:]

    public func put(_ key: BundleKey, value: Any?) {
        data[key.rawValue] = value
    }

    public func get<T>(_ key: BundleKey) -> T? {
        return data[key.rawValue] as? T
    }

    public func get<T>(_ key: BundleKey, _: T.Type) -> T? {
        return data[key.rawValue] as? T
    }

    public func put(_ key: String, value: Any) {
        data[key] = value
    }

    public func get<T>(_ key: String) -> T? {
        return data[key] as? T
    }

    public func get<T>(_ key: String, _: T.Type) -> T? {
        return data[key] as? T
    }

    public static func from(_ action: (BundleData) -> Void) -> BundleData {
        let bundle = BundleData()

        action(bundle)

        return bundle
    }
}

public protocol BundleKey {
    var rawValue: String { get }
}
