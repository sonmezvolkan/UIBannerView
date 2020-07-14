//
//  UIBannerViewDefaultCell.swift
//  UIBannerView
//
//  Created by Volkan Sonmez on 13.01.2020.
//  Copyright © 2020 Porte. All rights reserved.
//

import UIKit;

internal class UIBannerViewDefaultCell: UICollectionViewCell
{
    @IBOutlet weak var imgBanner: UIImageView!
    
    public func bind(banner: IBannerModel)
    {
        if let sourceType = banner.getSourceType(), sourceType == .local
        {
            self.imgBanner.image = UIImage(named: banner.getImage());
        }
        else
        {
            self.imgBanner.downloadImage(link: banner.getImage(), mode: .scaleAspectFill);
        }
    }
}
