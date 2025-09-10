//
//  SceneDelegate.swift
//  test
//
//  Created by Eldar Akkozov on 9/9/25.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    private var router: Router?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
                
        window = UIWindow(windowScene: windowScene)
        window?.makeKeyAndVisible()
        
        let controller = RouterController()
        router = Router(controller)
        
        router?.initialize(ScreenKeys.auth)

        window?.rootViewController = controller
    }

}

