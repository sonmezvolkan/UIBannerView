# UIBannerView

[![](Resources/defaultcell.gif)](defaultcell.gif)
[![](Resources/customcell.gif)](customcell.gif)

## Installation

UIBannerView supports swift 5.0, iOS 12

1. Add pod ‘UIBannerView’
2. Install the pods by running pod install.
3. Add import UIBannerView in the .swift files where you want to use it.

# Basic Usage

## Default Usage

```swift
     @IBOutlet weak var bannerView: UIBannerView!
     
     
     self.bannerView.setDefaultBanners(banners: `yourArray`); // object of array has to conform IBannerModel protocol
```

## Custom Cell 

create your custom cell. 

```swift

private var yourArray = [YourArray]();

private func setUp()
{
    self.bannerView.dataSource = self;
    self.bannerView.delegate = self;
    self.bannerView.addRegisterCustomCell(nibName: "CustomCell", forCellWithReuseIdentifier: "CustomCell");
    self.bannerView.reloadData();
 }
     
 extension ViewController: UIBannerViewDataSource
 {
    func bannerView(_ bannerView: UIBannerView, didSelectItemAt indexPath: IndexPath)
    {
        print("tapped \(indexPath)");
    }
}

extension ViewController: UIBannerViewDelegate
{
    func bannerView(_ bannerView: UIBannerView, numberOfItemsInSection section: Int) -> Int
    {
        return self.customBanner.count;
    }
    
    func bannerView(_ bannerView: UIBannerView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = bannerView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CustomCell;
        cell.bind(model: self.customBanner[indexPath.row]);
        return cell;
    }
}
```

## Caveats

[![](Resources/ss.png)](ss.png)

cells width is equal to screens width - padding.

Item spacing is the gap between cell and the next one.

ShowPageControl: if off, it will not show, and if it's on, it will show (the page controler)

Left and right margins should be a total of 100
if the margin is more than 50, it will show more than needed. 

If the PagingEnabled is on, it will treat the screens as pages, and if its off it will show them as free scroll

Track color is related to show page control, it will mark the active page on the page scroll 

### Dependencies
 UIBannerView uses `SDWebImage`
