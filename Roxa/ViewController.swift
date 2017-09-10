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

class ViewController: UIViewController, UIWebViewDelegate   {
   
    @IBOutlet weak var roxaWebView: UIWebView!
   
    // Set the webview delgate to self
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        roxaWebView.delegate = self
        self.roxaWebView.scalesPageToFit = false
        self.roxaWebView.isMultipleTouchEnabled = false
      
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
       
        // Define the url to be displayed
        let urlPath:String = "http://jaxonstevens.com"
        // Make a URL request and set the url path
        let roxaURL = URLRequest(url:URL(string: urlPath)!)
        // load the url defined
        self.roxaWebView.loadRequest(roxaURL)
        
        // Call the loading view function
        loadingView()
        // Call the network check function
        
    }
    
    // Call this function when the view is loading to display a alert view
    func loadingView() {
        
        JSSAlertView().show(self, title: "Loading Roxa", noButtons: true, delay: 3)
    }
    
    // Check the network call and if there is a connection proceed, if not show a warning
    func networkCheck() {
        
      var networkCheckAlertView = JSSAlertView().show(self,
            title: "Network Connection Error",
            text: "Please check your connection",
            color: UIColorFromHex (0xF95C5C, alpha: 1))
          //  customIcon:("")

        
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

