//
//  BaseViewModel.swift
//  test
//
//  Created by Eldar Akkozov on 9/9/25.
//

import Foundation

class BaseViewModel: ObservableObject {
    
    var router: Router?
    var bundle: BundleData?
    
    func setup(_ router: Router, _ bundle: BundleData?) {
        self.router = router
        self.bundle = bundle
    }
    
}
