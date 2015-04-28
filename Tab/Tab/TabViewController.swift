//
//  Created by Nick Snyder on 4/28/15.
//  Copyright (c) 2015 Example. All rights reserved.
//

import UIKit

class TabViewController: UIViewController {
  private var backgroundColor: UIColor
  private var url: NSURL?
  private var webView: UIWebView! { return view as UIWebView }
  
  init(url: NSURL?, backgroundColor: UIColor, tabBarItem: UITabBarItem) {
    self.url = url
    self.backgroundColor = backgroundColor
    super.init(nibName: nil, bundle: nil)
    self.tabBarItem = tabBarItem
  }

  required init(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func loadView() {
    view = UIWebView()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = backgroundColor
    webView.scrollView.decelerationRate = UIScrollViewDecelerationRateNormal
  }
  
  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
    if let url = url {
      let request = NSURLRequest(URL: url, cachePolicy: NSURLRequestCachePolicy.ReloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 10)
      webView.loadRequest(request)
    }
  }
  
  override func viewWillDisappear(animated: Bool) {
    super.viewWillDisappear(animated)
    AppDelegate.sharedInstance.clearWebViewCache()
  }
  
  override func viewDidDisappear(animated: Bool) {
    super.viewDidDisappear(animated)
    view = nil
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    NSLog("memory warning!")
  }
}
