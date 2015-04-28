//
//  AppDelegate.swift
//  Tab
//
//  Created by Nick Snyder on 4/28/15.
//  Copyright (c) 2015 Example. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow!
  
  class var sharedInstance: AppDelegate {
    return UIApplication.sharedApplication().delegate as AppDelegate
  }
  
  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    let sharedCache = NSURLCache(memoryCapacity: 0, diskCapacity: 0, diskPath: nil)
    NSURLCache.setSharedURLCache(sharedCache)
    clearImageCache()
    clearWebViewCache()
    
    window = UIWindow(frame: UIScreen.mainScreen().bounds)
    window.rootViewController = TabBarController()
    window.backgroundColor = UIColor.redColor()
    window.makeKeyAndVisible()
    return true
  }
  
  func clearImageCache() {
    SDWebImagePrefetcher.sharedImagePrefetcher().cancelPrefetching()
    SDImageCache.sharedImageCache().clearMemory()
    SDImageCache.sharedImageCache().clearDisk()
  }
  
  func clearWebViewCache() {
    NSURLCache.sharedURLCache().removeAllCachedResponses()
    /*
    (void) removeCacheFiles
    {
    NSString *cacheDir=[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *nsurlDir = [[NSString alloc] initWithFormat:@"%@/com.company.SampleApp", cacheDir];
    NSFileManager  *manager = [NSFileManager defaultManager];
    
    
    // grab all the files in the documents dir
    NSArray *allFiles = [manager contentsOfDirectoryAtPath:nsurlDir error:nil];
    
    // filter the array for only sqlite files
    NSPredicate *fltr = [NSPredicate predicateWithFormat:@"self ENDSWITH '.db'"];
    NSArray *dbFiles = [allFiles filteredArrayUsingPredicate:fltr];
    
    // use fast enumeration to iterate the array and delete the files
    for (NSString *dbFile in dbFiles)
    {
    NSError *error = nil;
    [manager removeItemAtPath:[nsurlDir stringByAppendingPathComponent:dbFile] error:&error];
    if (error != nil) {
    NSLog(@"Error:%@", [error description]);
    } else {
    NSLog(@"DB FILE Cleared: %@", dbFile);
    }
    }
    NSError *error = nil;
    [manager removeItemAtPath:[nsurlDir stringByAppendingString:@"/nsurlcache"] error:&error];
    if (error != nil) {
    NSLog(@"Error:%@", [error description]);
    } else {
    NSLog(@"Dir Cleared");
    }
    }
    */
  }

  func applicationWillResignActive(application: UIApplication) {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
  }

  func applicationDidEnterBackground(application: UIApplication) {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
  }

  func applicationWillEnterForeground(application: UIApplication) {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
  }

  func applicationDidBecomeActive(application: UIApplication) {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
  }

  func applicationWillTerminate(application: UIApplication) {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
  }


}

