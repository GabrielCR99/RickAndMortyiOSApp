//
//  Extensions.swift
//  RickAndMorty
//
//  Created by Gabriel Roveri on 03/07/23.
//

import Foundation
import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach({ addSubview($0) })
    }
}

extension CACornerMask {
    static var topLeft: CACornerMask {
        get {
            return CACornerMask.layerMinXMinYCorner
        }
    }

    static var topRight: CACornerMask {
        get {
            return CACornerMask.layerMaxXMinYCorner
        }
    }

    static var bottomLeft: CACornerMask {
        get {
            return CACornerMask.layerMinXMaxYCorner
        }
    }

    static var bottomRight: CACornerMask {
        get {
            return CACornerMask.layerMaxXMaxYCorner
        }
    }
}

extension UIDevice {
    static let isIphone = UIDevice.current.userInterfaceIdiom == .phone
}
