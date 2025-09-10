//
//  BaseController.swift
//  test
//
//  Created by Eldar Akkozov on 9/9/25.
//

import UIKit
import SwiftUI

class BaseController: UIHostingController<AnyView> {
    
    public let key: ScreenKey
    
    init(rootView: (any View), _ key: ScreenKey) {
        self.key = key
        
        super.init(rootView: AnyView(rootView))
    
        view.backgroundColor = .veryLight
    }
    
    @MainActor @preconcurrency required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
