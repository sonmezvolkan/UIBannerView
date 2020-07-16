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
    private var showScrollBar: Bool = false;
    private var isPageControlOverCollection: Bool = false;
    private var pagingEnabled: Bool = true;
    private var trackColor: UIColor = UIColor(red: 255, green: 255, blue: 255, alpha: 16);
    private var currentColor: UIColor = UIColor(red: 255, green: 255, blue: 255);
    
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
    
    @IBInspectable open var ShowScrollBar: Bool
    {
        get { return self.showScrollBar; }
        set { self.showScrollBar = newValue; }
    }
    
    @IBInspectable open var IsPageControlOverCollection: Bool
    {
        get { return self.isPageControlOverCollection; }
        set { self.isPageControlOverCollection = newValue; }
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
    
    @IBInspectable open var TrackColor: UIColor
    {
        get { return self.trackColor; }
        set { self.trackColor = newValue; }
    }
    
    @IBInspectable open var CurrentColor: UIColor
    {
        get { return self.currentColor; }
        set { self.currentColor = newValue; }
    }
}
