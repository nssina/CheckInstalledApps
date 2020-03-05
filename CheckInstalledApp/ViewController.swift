//
//  ViewController.swift
//  CheckInstalledApp
//
//  Created by Sina Rabiei on 3/5/20.
//  Copyright © 2020 Sina Rabiei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        checkAndOpenApp()
    }
    
    func checkAndOpenApp(){
        let app = UIApplication.shared
        let appScheme = "app1://app"
        if app.canOpenURL(URL(string: appScheme)!) {
            print("App is install and can be opened")
            let url = URL(string:appScheme)!
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(url)
            }
        } else {
            print("App in not installed. Go to AppStore")
            if let url = URL(string: "https://apps.apple.com/us/app/App1/id1445847940?ls=1"),
                UIApplication.shared.canOpenURL(url)
            {
                if #available(iOS 10.0, *) {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                } else {
                    UIApplication.shared.openURL(url)
                }
            }
        }
    }
}

