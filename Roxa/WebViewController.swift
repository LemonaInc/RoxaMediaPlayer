//
//  WebViewController.swift
//  Roxa
//
//  Created by Jaxon Stevens on 10/5/17.
//  Copyright © 2017 Jaxon Stevens. All rights reserved.
//
import UIKit
import WebKit
import JSSAlertView
import JavaScriptCore

class WebViewController: UIViewController, WKScriptMessageHandler {
    
    // Define and set icon images for alert views
    var networkFailedIconImage = UIImage(named:"ic_signal_wifi_off_white_48pt")
    var loadingIconImage = UIImage(named: "ic_music_video_white_48pt")
    
    @IBOutlet var roxaView : UIView! = nil
    var webView: WKWebView?
    
    override func loadView() {
        super.loadView()
        
        var contentController = WKUserContentController();
        var userScript = WKUserScript(
            source: "redHeader()",
            injectionTime: WKUserScriptInjectionTime.atDocumentEnd,
            forMainFrameOnly: true
        )
        contentController.addUserScript(userScript)
        contentController.add(
            self,name: "callbackHandler"
        )
        
        var config = WKWebViewConfiguration()
        config.userContentController = contentController
        
        self.webView = WKWebView(
            frame: self.roxaView.bounds,
            configuration: config
        )
        self.view = self.webView!
    }
    
   // VIEW DID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        var url = NSURL(string:"http://localhost:8888/player.php")
        var req = NSURLRequest(url:url as! URL)
        self.webView!.load(req as URLRequest)
        
        // Create a timer to check the network connection again
        let checkNetworkTimer = Timer.scheduledTimer(
            timeInterval: 2.0, target: self, selector: #selector(ViewController.networkCheck),
            userInfo: nil, repeats: true)
        
        loadingView()

    }
    
    
    func userContentController(_ userContentController: WKUserContentController!, didReceive message: WKScriptMessage!) {
        if(message.name == "callbackHandler") {
            
            print("JavaScript is sending a message \(message.body)")
            
            var loadingAlertView = JSSAlertView().show(self,
            title: "JAVASCRIPT SAYS \(message.body)",
            noButtons: true,
            color: UIColorFromHex (0x32D4E1, alpha: 1),
            iconImage: loadingIconImage,
            delay: 3)
            loadingAlertView.setTextTheme(.light)
        }
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
    }
    
    
    
}






