//
//  ViewController.swift
//  Roxa
//
//  Created by Jaxon Stevens on 9/7/17.
//  Copyright © 2017 Jaxon Stevens. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController  {
    
    
    @IBOutlet weak var webview: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.webview.scalesPageToFit = false
        self.webview.isMultipleTouchEnabled = false
        
    
      //  https://app.outbully.com/admin
        let urlPath:String = "http://localhost:8888/"
        let theURL = URLRequest(url:URL(string: urlPath)!)
        
        
        self.webview.loadRequest(theURL)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

