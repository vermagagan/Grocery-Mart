//
//  cartHelper.swift
//  dummyApp2
//
//  Created by Gagan Verma on 06/04/26.
//

import Foundation
import UIKit
extension UIViewController{
    func presentCart() {
        let cartVC = CartVC()
        let nav = UINavigationController(rootViewController: cartVC)
        present(nav, animated: true)
    }
}
