//
//  UIBannerDesignable.swift
//  UIBannerView
//
//  Created by Volkan Sonmez on 13.01.2020.
//  Copyright © 2020 Porte. All rights reserved.
//

import UIKit;

open class UIBannerDesignable: UIView
{
    private var padding: CGFloat = 96.0;
    private var itemSpacing: CGFloat = 12.0;
    private var leftPercentage: CGFloat = 30.0;
    private var rightPercentage: CGFloat = 70.0;
    private var showPageControl: Bool = false;
    private var pagingEnabled: Bool = true;
    
    @IBInspectable open var Padding: CGFloat
    {
        get { return self.padding; }
        set { self.padding = newValue ;}
    }
    
    @IBInspectable open var ItemSpacing: CGFloat
    {
        get { return self.itemSpacing; }
        set { self.itemSpacing = newValue; }
    }
    
    @IBInspectable open var ShowPageControl: Bool
    {
        get { return self.showPageControl; }
        set { self.showPageControl = newValue; }
    }
    
    @IBInspectable open var LeftPercentage: CGFloat
    {
        get { return self.leftPercentage; }
        set { self.leftPercentage = newValue; }
    }
    
    @IBInspectable open var RightPercentage: CGFloat
    {
        get { return self.rightPercentage; }
        set { self.rightPercentage = newValue; }
    }
    
    @IBInspectable open var PagingEnabled: Bool
    {
        get { return self.pagingEnabled; }
        set { self.pagingEnabled = newValue; }
    }
}
