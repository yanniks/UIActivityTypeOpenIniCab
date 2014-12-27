//
//  ViewController.swift
//  Open in iCab Example
//
//  Created by Yannik Ehlert on 27.12.14.
//  Copyright (c) 2014 Yannik Ehlert. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIWebViewDelegate {
    @IBOutlet weak var webview: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        webview.loadRequest(NSURLRequest(URL: NSURL(string: "https://yanniks.de")!))
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func share(sender: AnyObject) {
        var url = webview.request?.URL
        let activity = UIActivityViewController(activityItems: [url!], applicationActivities: [UIActivityTypeOpenIniCab()])
        self.presentViewController(activity, animated: true, completion: nil)
        if activity.respondsToSelector("popoverPresentationController") {
            let presentationController = activity.popoverPresentationController
            presentationController?.sourceView = view
        }
    }

}

