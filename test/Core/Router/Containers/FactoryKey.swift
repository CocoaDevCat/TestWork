//
//  FactoryKey.swift
//  test
//
//  Created by Eldar Akkozov on 9/9/25.
//

import Foundation

public struct FactoryKey: Hashable {

    @usableFromInline let type: ObjectIdentifier
    @usableFromInline let key: String

    @inlinable
    @inline(__always)
    init(_ type: Any.Type, _ key: ScreenKey) {
        self.type = ObjectIdentifier(type)
        self.key = key.rawValue
    }

    @inlinable
    @inline(__always)
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.type)
    }

    @inlinable
    public static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.key == rhs.key
    }

}
