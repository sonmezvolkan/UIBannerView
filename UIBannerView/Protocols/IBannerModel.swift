//
//  IBanner.swift
//  UIBannerView
//
//  Created by Volkan Sonmez on 13.01.2020.
//  Copyright © 2020 Porte. All rights reserved.
//

import Foundation

public protocol IBannerModel
{
    func getSourceType() -> IBannerSourceType?
    
    func getImage() -> String;
}

public enum IBannerSourceType: Int
{
    case web = 0
    case local = 1
}

