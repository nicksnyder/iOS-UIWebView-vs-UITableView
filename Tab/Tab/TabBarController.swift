//
//  Created by Nick Snyder on 4/28/15.
//  Copyright (c) 2015 Example. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
  override func viewDidLoad() {
    super.viewDidLoad()
    self.viewControllers = [
      TabViewController(url: nil, backgroundColor: UIColor.yellowColor(), tabBarItem: UITabBarItem(title: "Reset", image: nil, selectedImage: nil)),
      //TabViewController(url: urlForHtmlFileNamed("list")!, backgroundColor: UIColor.blueColor(), tabBarItem: UITabBarItem(tabBarSystemItem: .Contacts, tag: 1)),
      TabViewController(url: urlForHtmlFileNamed("list10")!, backgroundColor: UIColor.blueColor(), tabBarItem: UITabBarItem(title: "UIWebView 10", image: nil, selectedImage: nil)),
      TabViewController(url: urlForHtmlFileNamed("list20")!, backgroundColor: UIColor.blueColor(), tabBarItem: UITabBarItem(title: "UIWebView 20", image: nil, selectedImage: nil)),
      TabViewController(url: urlForHtmlFileNamed("list100")!, backgroundColor: UIColor.blueColor(), tabBarItem: UITabBarItem(title: "UIWebView 100", image: nil, selectedImage: nil)),
      TableViewController()
    ]
  }
  
  private func urlForHtmlFileNamed(name: String) -> NSURL? {
    return NSBundle.mainBundle().URLForResource(name, withExtension: "html")
  }
}
