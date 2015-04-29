# iOS-UIWebView-vs-UITableView
Compare performance of native rendering vs UIWebView rendering

## SDWebImageBug

In TableViewController.swift:L40, we can reproduce a deadlock condition in SDWebImage 3.7.2 by setting maxConcurrentDownloads to 1024.
