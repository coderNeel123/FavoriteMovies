//
//  WebViewVC.swift
//  FavoriteMovies
//
//  Created by Neel Khattri on 7/28/16.
//  Copyright © 2016 SimpleStuff. All rights reserved.
//

import UIKit
import WebKit

class WebViewVC: UIViewController {
    
    @IBOutlet weak var containerOfView: UIView!
    
    var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        
        super.viewDidAppear(animated)
        webView = WKWebView()
        containerOfView.addSubview(webView)
        
        let frameOfView = CGRectMake(0, 0, containerOfView.bounds.width, containerOfView.bounds.height)
        webView.frame = frameOfView
        
        let url = DataService.instance.linkClicked
        let actualUrl = NSURL(string: url)!
        let request = NSURLRequest(URL: actualUrl)
        
        webView.loadRequest(request)
    }


    @IBAction func goBackButtonPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
