//
//  LaunchScreenViewController.swift
//  Roxa
//
//  Created by Jaxon Stevens on 9/10/17.
//  Copyright © 2017 Jaxon Stevens. All rights reserved.
//

import Foundation
import JSSAlertView


class LaunchScreenViewController: UIViewController {

    // Set a welcome icon from Assets.xacassets and load in image by name
    var welcomeIcon = UIImage(named:"ic_library_music_white_48pt")
    
     override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func viewDidAppear(_ animated: Bool) {
        
      var roxaWelcomeAlertView = JSSAlertView().show(self,
       title: "Welcome To Roxa!",
       text: "Get ready to rock out to your favorite jams!",
       color: UIColorFromHex (0xED2E9C, alpha: 1),
       iconImage: welcomeIcon)
        
        // Set the color theme of this JSS Alert View to white
        roxaWelcomeAlertView.setTextTheme(.light)
        
    
    }
    
  
    
}
