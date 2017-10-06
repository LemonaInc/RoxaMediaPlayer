//
//  ViewController.swift
//  Roxa
//
//  Created by Jaxon Stevens on 9/7/17.
//  Copyright © 2017 Jaxon Stevens. All rights reserved.
//

import UIKit
import WebKit
import JSSAlertView
import JavaScriptCore

class ViewController: UIViewController {
    @IBOutlet weak var roxaWebView: WKWebView!
   
    // Define and set icon images for alert views
    var networkFailedIconImage = UIImage(named:"ic_signal_wifi_off_white_48pt")
    var loadingIconImage = UIImage(named: "ic_music_video_white_48pt")
    

    
    // Set the webview delgate to self
    override func viewDidLoad() {
        super.viewDidLoad()
        // Create a timer to check the network connection again
        let checkNetworkTimer = Timer.scheduledTimer(
            timeInterval: 2.0, target: self, selector: #selector(ViewController.networkCheck),
            userInfo: nil, repeats: true)
    
       // roxaWebView.delegate = self
      //  self.roxaWebView.scalesPageToFit = false
        self.roxaWebView.isMultipleTouchEnabled = false
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
       // Define the url to be displayed
        let urlPath:String = "http://localhost:8888/player.php"
        // Make a URL request and set the url path
        let roxaURL = URLRequest(url:URL(string: urlPath)!)
        // load the url defined
        self.roxaWebView.load(roxaURL)
        // Call the loading view function
        loadingView()
        // Call the network check function
    }
    
    
    // Call this function when the view is loading to display a alert view
    func loadingView() {
        
        networkCheck()
        
        var loadingAlertView = JSSAlertView().show(self,
        title: "Loading Roxa",
        noButtons: true,
        color: UIColorFromHex (0x2F302F, alpha: 1),
        iconImage: loadingIconImage,
        delay: 3)
        
        loadingAlertView.setTextTheme(.light)

    }
    
    // Check the network call and if there is a connection proceed, if not show a warning
    func networkCheck() {
        
        // Network Reached Image for JSS Popup
        let networkReachedImage = UIImage(named:"ic_signal_wifi_off_white")
        
        // If the network connection is true the do
        if NetworkReachability.isConnectedToNetwork() == true
        {
        }
            // If the network conenction cannot be reached or fails then do
        else
        {
            
            var networkCheckAlertView = JSSAlertView().show(self,
             title: "Network Connection Error",
            text: "Please check your connection",
            color: UIColorFromHex (0xF95C5C, alpha: 1),
            iconImage: networkFailedIconImage)
            
            networkCheckAlertView.setTextTheme(.light)
        }
        
    }
    
    // Webview did load
    func webViewDidFinishLoad(webView: UIWebView) {
        print("webview did finish load!")
        
        
    }
    
    // Webview did fail to load with error
    func webView(webView: UIWebView, didFailLoadWithError error: Error) {
        print("webview did fail load with error: \(error)")
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

