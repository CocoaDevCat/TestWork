//
//  ContainerManager.swift
//  test
//
//  Created by Eldar Akkozov on 9/9/25.
//

public final class ContainerManager {

    internal typealias ScreenFactoryMap = [FactoryKey: Factory]

    internal lazy var factoryRegistrations: ScreenFactoryMap = .init(minimumCapacity: 256)

}
