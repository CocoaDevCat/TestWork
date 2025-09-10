//
//  FactoryRegistration.swift
//  test
//
//  Created by Eldar Akkozov on 9/9/25.
//

import Foundation
import UIKit

public class RouterController: BaseNavigationController {
    
    func set(_ controller: UIViewController) {
        viewControllers = [controller]
        
        setViewControllers(viewControllers, animated: true)
    }

    func push(_ controller: UIViewController) {        
        pushViewController(controller, animated: true)
    }

    func present(_ controller: UIViewController) {
        present(controller, animated: true)
    }

    func pop() {
        popViewController(animated: true)
    }
    
    func remove(_ key: ScreenKey) {
        let screens = viewControllers.filter {
            let controller = $0 as? BaseController
            
            return key.rawValue != controller?.key.rawValue
        }
        
        setViewControllers(screens, animated: false)
    }
}
