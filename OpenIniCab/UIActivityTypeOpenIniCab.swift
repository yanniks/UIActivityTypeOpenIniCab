//
//  UIActivityTypeOpenIniCab.swift
//  MDG Nienburg
//
//  Created by Yannik Ehlert on 26.12.14.
//  Copyright (c) 2014 Yannik Ehlert. All rights reserved.
//

import UIKit

class UIActivityTypeOpenIniCab:UIActivity {
    var acurl = NSURL()
    override func activityImage() -> UIImage? {
        return UIImage(named: "OpenIniCab")
    }
    override func activityType() -> String? {
        return NSStringFromClass(UIActivityTypeOpenIniCab.self)
    }
    override func activityTitle() -> String? {
        return NSLocalizedString("Open in iCab",comment:"")
    }
    override class func activityCategory() -> UIActivityCategory {
        return UIActivityCategory.Action
    }
    override func prepareWithActivityItems(activityItems: [AnyObject]) {
        for item in activityItems {
            if item is NSURL {
                var url = item as NSURL
                if (url.scheme == "http")||(url.scheme == "https") {
                    var string = (url.absoluteString)!.substringFromIndex(advance((url.absoluteString)!.startIndex,4))
                    acurl = NSURL(string: "web" + string)!
                }
            }
        }
    }
    override func performActivity() {
        UIApplication.sharedApplication().openURL(acurl)
        self.activityDidFinish(true)
    }
    override func canPerformWithActivityItems(activityItems: [AnyObject]) -> Bool {
        if !UIApplication.sharedApplication().canOpenURL(NSURL(string: "webs://")!) {
            return false
        }
        for item in activityItems {
            if item is NSURL {
                var url = item as NSURL
                if (url.scheme == "http")||(url.scheme == "https") {
                    return true
                } else {
                    return false
                }
            }
        }
        return false
    }
}
