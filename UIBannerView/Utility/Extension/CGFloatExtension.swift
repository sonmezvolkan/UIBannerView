//
//  CGFloatExtension.swift
//  UIBannerView
//
//  Created by Volkan Sonmez on 13.01.2020.
//  Copyright © 2020 Porte. All rights reserved.
//

import UIKit;

extension CGFloat
{
    public func getPercentage(totalValue: CGFloat) -> CGFloat
    {
        return self * totalValue / 100;
    }
}
