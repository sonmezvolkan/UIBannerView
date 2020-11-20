//
//  ScrollViewExtension.swift
//  UIBannerView
//
//  Created by Volkan SÖNMEZ on 20.11.2020.
//  Copyright © 2020 Porte. All rights reserved.
//

import Foundation
import UIKit

extension UIScrollView {
    
    public func scrollToPosition(point: CGPoint) {
        setContentOffset(point, animated: true)
    }
}
