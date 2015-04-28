//
//  Created by Nick Snyder on 4/28/15.
//  Copyright (c) 2015 Example. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
  
  private let cellId = "TableViewCell"
  
  convenience override init() {
    self.init(nibName: nil, bundle: nil)
    self.tabBarItem = UITabBarItem(title: "UITableView", image: nil, selectedImage: nil)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.rowHeight = 80
    tableView.registerNib(UINib(nibName: cellId, bundle: nil), forCellReuseIdentifier: cellId)
  }
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 100
  }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    var urls: [AnyObject] = []
    for var i=0; i<100; i++ {
      urls.append(self.urlForIndexPath(NSIndexPath(forItem: i, inSection: 0))!)
      urls.append(self.urlForIndexPath(NSIndexPath(forItem: i, inSection: 1))!)
      urls.append(self.urlForIndexPath(NSIndexPath(forItem: i, inSection: 2))!)
      urls.append(self.urlForIndexPath(NSIndexPath(forItem: i, inSection: 3))!)
      urls.append(self.urlForIndexPath(NSIndexPath(forItem: i, inSection: 4))!)
      urls.append(self.urlForIndexPath(NSIndexPath(forItem: i, inSection: 5))!)
      urls.append(self.urlForIndexPath(NSIndexPath(forItem: i, inSection: 6))!)
      urls.append(self.urlForIndexPath(NSIndexPath(forItem: i, inSection: 7))!)
    }
    // BUG: Set maxConcurrentDownloads to 1024 to induce deadlock in SDWebImage
    SDWebImagePrefetcher.sharedImagePrefetcher().maxConcurrentDownloads = 32
    SDWebImagePrefetcher.sharedImagePrefetcher().prefetchURLs(urls)
  }
  
  override func viewWillDisappear(animated: Bool) {
    super.viewWillDisappear(animated)
    AppDelegate.sharedInstance.clearImageCache()
  
  }
  override func viewDidDisappear(animated: Bool) {
    super.viewDidDisappear(animated)
    view = nil
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier(cellId, forIndexPath: indexPath) as TableViewCell
    cell.titleLabel.text = "Here are 8 random imgs"
    setRandomImage(cell.imageView1, indexPath: NSIndexPath(forItem: indexPath.item, inSection: 0))
    setRandomImage(cell.imageView2, indexPath: NSIndexPath(forItem: indexPath.item, inSection: 1))
    setRandomImage(cell.imageView3, indexPath: NSIndexPath(forItem: indexPath.item, inSection: 2))
    setRandomImage(cell.imageView4, indexPath: NSIndexPath(forItem: indexPath.item, inSection: 3))
    setRandomImage(cell.imageView5, indexPath: NSIndexPath(forItem: indexPath.item, inSection: 4))
    setRandomImage(cell.imageView6, indexPath: NSIndexPath(forItem: indexPath.item, inSection: 5))
    setRandomImage(cell.imageView7, indexPath: NSIndexPath(forItem: indexPath.item, inSection: 6))
    setRandomImage(cell.imageView8, indexPath: NSIndexPath(forItem: indexPath.item, inSection: 7))
    return cell
  }
  
  private func setRandomImage(imageView: UIImageView, indexPath: NSIndexPath) {
    imageView.sd_setImageWithURL(self.urlForIndexPath(indexPath), placeholderImage: nil, options: SDWebImageOptions.HighPriority)
  }
  
  private func urlForIndexPath(indexPath: NSIndexPath) -> NSURL? {
    return NSURL(string: "http://lorempixel.com/100/100/?item=\(indexPath.item)&section=\(indexPath.section)")
  }
}
