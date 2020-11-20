//
//  UIBannerViewProtocols.swift
//  UIBannerView
//
//  Created by Volkan Sonmez on 13.01.2020.
//  Copyright © 2020 Porte. All rights reserved.
//

import UIKit;

public protocol UIBannerViewDelegate: class
{
    func bannerView(_ bannerView: UIBannerView, numberOfItemsInSection section: Int) -> Int
    func bannerView(_ bannerView: UIBannerView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
}

public protocol UIBannerViewDataSource : class
{
    func bannerView(_ bannerView: UIBannerView, didSelectItemAt indexPath: IndexPath)
    func bannerView(_ bannerView: UIBannerView, didPageChange row: Int)
}

