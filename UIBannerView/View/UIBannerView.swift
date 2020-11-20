//
//  UIBannerView.swift
//  UIBannerView
//
//  Created by Volkan Sonmez on 13.01.2020.
//  Copyright © 2020 Porte. All rights reserved.
//

import UIKit;

open class UIBannerView: UIBannerDesignable, UICollectionViewDelegateFlowLayout
{
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var constraintBottom: NSLayoutConstraint!
    
    private var banners: [IBannerModel]?;
    
    open weak var delegate : UIBannerViewDelegate?;
    open weak var dataSource : UIBannerViewDataSource?;
    
    override public init(frame: CGRect)
    {
        super.init(frame: frame);
        self.setUp();
    }
    
    public required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder);
        self.setUp();
    }
    
    public override func awakeFromNib()
    {
        super.awakeFromNib();
        self.setUp();
    }
    
    public override func layoutSubviews()
    {
        super.layoutSubviews();
        self.contentView.frame = self.bounds;
        self.contentView.autoresizingMask = [ .flexibleWidth, .flexibleHeight ];
        self.setControls();
    }
    
    private func setUp()
    {
        self.getPodBundle().loadNibNamed("UIBannerView", owner: self, options: nil);
        self.addSubview(self.contentView);
        self.bannerInit();
    }
    
    private func setControls()
    {
        if (!self.ShowPageControl)
        {
            self.constraintBottom.constant = 0;
            self.pageControl.isHidden = true;
        }
        else
        {
            self.pageControl.pageIndicatorTintColor = self.CurrentColor;
            self.pageControl.currentPageIndicatorTintColor = self.TrackColor;
            self.constraintBottom.constant = self.IsPageControlOverCollection ? 0 : 37
        }
    }
    
    public func bannerInit()
    {
        self.collectionView.delegate = self;
        self.collectionView.dataSource = self;
        self.collectionView.register(UINib.init(nibName: "UIBannerViewDefaultCell", bundle: self.getPodBundle()), forCellWithReuseIdentifier: "UIBannerViewDefaultCell");
        if let flowLayout = self.collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .horizontal;
        }
        self.collectionView.showsHorizontalScrollIndicator = self.ShowScrollBar
        self.collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0);
        self.collectionView.decelerationRate = UIScrollView.DecelerationRate.fast;
    }
    
    private func setPageControlNumberOfPages(count: Int)
    {
        self.pageControl.numberOfPages = count;
        self.pageControl.currentPage = 0;
    }
    
    private func getPodBundle() -> Bundle
    {
        let podBundle = Bundle(for: UIBannerView.self);
        let bundleURL = podBundle.url(forResource: "UIBannerView", withExtension: "bundle")
        return Bundle(url: bundleURL!)!
    }
}

extension UIBannerView
{
    open func setDefaultBanners(banners: [IBannerModel])
    {
        self.banners = banners;
        self.setPageControlNumberOfPages(count: banners.count);
        self.reloadData();
    }
    
    open func addRegisterCustomCell(nib: UINib, forCellWithReuseIdentifier: String)
    {
        self.collectionView.register(nib, forCellWithReuseIdentifier: forCellWithReuseIdentifier);
    }
    
    open func dequeueReusableCell(withReuseIdentifier: String, for indexPath: IndexPath) -> UICollectionViewCell
    {
        return self.collectionView.dequeueReusableCell(withReuseIdentifier: withReuseIdentifier, for: indexPath);
    }
    
    open func reloadData()
    {
        self.collectionView.reloadData();
    }
}

extension UIBannerView : UICollectionViewDelegate, UICollectionViewDataSource
{
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets
    {
        return UIEdgeInsets(top: 0, left: self.LeftPercentage.getPercentage(totalValue: self.Padding), bottom: 0, right: self.RightPercentage.getPercentage(totalValue: self.Padding));
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let width = UIScreen.main.bounds.width - self.Padding;
        return CGSize(width: width, height: self.frame.height);
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat
    {
        return self.ItemSpacing;
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        if let delegate = delegate
        {
            let count = delegate.bannerView(self, numberOfItemsInSection: section);
            self.setPageControlNumberOfPages(count: count);
            return count;
        }
        return (self.banners == nil) ? 0 : self.banners!.count;
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        if let delegate = self.delegate
        {
            return delegate.bannerView(self, cellForItemAt: indexPath);
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UIBannerViewDefaultCell", for: indexPath) as! UIBannerViewDefaultCell;
        cell.bind(banner: self.banners![indexPath.row]);
        return cell;
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        self.dataSource?.bannerView(self, didSelectItemAt: indexPath);
    }
    
    public func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>)
    {
        if (!self.PagingEnabled)
        {
            return;
        }
        let itemWidth = CGFloat(UIScreen.main.bounds.width - self.Padding);
        let pageWidth = Float(itemWidth + ItemSpacing);
        let targetXContentOffset = Float(targetContentOffset.pointee.x);
        let contentWidth = Float(self.collectionView!.contentSize.width);
        var newPage = Float(self.pageControl.currentPage);
        if (velocity.x == 0)
        {
            if (Int(newPage) < self.pageControl.numberOfPages)
            {
                newPage = floor( (targetXContentOffset - Float(pageWidth) / 2) / Float(pageWidth)) + 1.0;
            }
        }
        else
        {
            newPage = Float(velocity.x > 0 ? self.pageControl.currentPage + 1 : self.pageControl.currentPage - 1);
            if (newPage < 0)
            {
                newPage = 0;
            }
            if (newPage > contentWidth / pageWidth)
            {
                newPage = ceil(contentWidth / pageWidth) - 1.0;
            }
        }
        if (Int(newPage) >= self.pageControl.numberOfPages)
        {
            newPage = Float(self.pageControl.numberOfPages) - 1
        }        
        self.pageControl.currentPage = Int(newPage);
        self.dataSource?.bannerView(self, didPageChange: Int(newPage))
        let point = CGPoint (x: CGFloat(newPage * pageWidth), y: targetContentOffset.pointee.y);
        targetContentOffset.pointee = point;
    }
    
    public func scrollToRow(row: Int) {
        let itemWidth = CGFloat(UIScreen.main.bounds.width - self.Padding);
        let pageWidth = Float(itemWidth + ItemSpacing)
        let newPage = Float(row)
        self.pageControl.currentPage = row
        let point = CGPoint (x: CGFloat(newPage * pageWidth), y: 0)
        collectionView.scrollToPosition(point: point)
    }
}



