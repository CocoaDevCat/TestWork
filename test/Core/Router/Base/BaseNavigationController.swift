//
//  BaseNavigationController.swift
//  test
//
//  Created by Eldar Akkozov on 9/9/25.
//

import Foundation
import UIKit

public class BaseNavigationController: UINavigationController {

    public override func viewDidLoad() {
        super.viewDidLoad()

        navigationBar.isHidden = true
        interactivePopGestureRecognizer?.isEnabled = true

        setupUI()
    }

    func setupUI() {
        view.backgroundColor = .veryLight
    }
}
