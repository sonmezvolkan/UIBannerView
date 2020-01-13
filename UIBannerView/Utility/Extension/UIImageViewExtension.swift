//
//  UIImageViewExtension.swift
//  UIBannerView
//
//  Created by Volkan Sonmez on 13.01.2020.
//  Copyright © 2020 Porte. All rights reserved.
//

import UIKit;
import SDWebImage

extension UIImageView
{
    public func downloadImage(link: String?, mode: ContentMode = ContentMode.scaleToFill)
    {
        if (link != nil)
        {
            if let url = URL(string: link!)
            {
                self.sd_setImage(with: url) { (image, error, cacheType, url) in
                    self.image = image;
                }
                self.contentMode = mode;
            }
        }
    }
    
    public func downloadImage(link: String?, mode: ContentMode = ContentMode.scaleToFill, placeHolderImage: UIImage)
    {
        self.image = placeHolderImage;
        if (link != nil)
        {
            if let url = URL(string: link!)
            {
                self.sd_setImage(with: url) { (image, error, cacheType, url) in
                    self.image = image;
                }
                self.contentMode = mode;
            }
        }
    }
}

