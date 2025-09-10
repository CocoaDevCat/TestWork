import Foundation

public protocol ScreenKey {
    var rawValue: String { get }
}

public enum RouteType {
    case push(_ to: ScreenKey)
    case set(_ to: ScreenKey)
    case present(_ to: ScreenKey)
    case remove(_ to: ScreenKey)
    case pop
}
