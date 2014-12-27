# Open in iCab

#### A UIActivity type for opening web pages in iCab

## Import

Move the files located in the OpenIniCab folder into your Xcode project. If you already have your `UIActivityViewController`, just add `UIActivityTypeOpenIniCab()` to the `applicationActivities`.
If not, try this:

    var url = NSURL(string: "https://yanniks.de")
    let activity = UIActivityViewController(activityItems: [url], applicationActivities: [UIActivityTypeOpenIniCab()])
    self.presentViewController(activity, animated: true, completion: nil)
    if activity.respondsToSelector("popoverPresentationController") {
        let presentationController = activity.popoverPresentationController
        presentationController?.sourceView = view
    }

Please note, that this is written in Swift. Swift supports iOS 7 and newer, iOS 6 is not supported. Take a look to the example application for further information.