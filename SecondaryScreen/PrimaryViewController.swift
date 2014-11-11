//
//  ViewController.swift
//  SecondScreen
//
//  Created by Julian Abentheuer on 10.11.14.
//  Copyright (c) 2014 Aaron Abentheuer. All rights reserved.
//

import UIKit

class PrimaryViewController: UIViewController {
    
    var screenInformation : UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blackColor()
        
        //Subscribing to a UIApplicationWillResignActiveNotification allows you to react to the user entering some sort of inactive mode of the application. This fires when opening the iOS Notification Center, leaving the application by pressing the Home-Button or switching the application. It fires as well when opening ControlCenter, for example to activate AirPlay Mirroring. This user-interface often times is confusing, especially since you have to activate the "mirroring" option seperately to make the second-screen experience work. To assist the user you could implement an assistive view that displays whenever "UIApplicationWillResignActive" is called and is removed from the canvas once "UIApplicationDidBecomeActive" is called. Keep in mind however that you can not explicitely tell in which one of the possible menus the user is in, so it is kind of a hack.
        var applicationStatusChangedNotification = NSNotificationCenter.defaultCenter()
        applicationStatusChangedNotification.addObserver(self, selector:("applicationWillResignActive:"), name:UIApplicationWillResignActiveNotification, object:nil)
        applicationStatusChangedNotification.addObserver(self, selector: ("applicationDidBecomeActive:"), name: UIApplicationDidBecomeActiveNotification, object: nil)
        
        //Subscribing to a UIScreenDidConnect/DisconnectNotification to react to changes in the status of connected screens.
        var screenConnectionStatusChangedNotification = NSNotificationCenter.defaultCenter()
        screenConnectionStatusChangedNotification.addObserver(self, selector:("screenConnectionStatusChanged"), name:UIScreenDidConnectNotification, object:nil)
        screenConnectionStatusChangedNotification.addObserver(self, selector:("screenConnectionStatusChanged"), name:UIScreenDidDisconnectNotification, object:nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func screenConnectionStatusChanged () {
    }
    
    func applicationWillResignActive(application: UIApplication) {
    }
    
    func applicationDidBecomeActive(application: UIApplication) {
    }
    
//    func setupInstructions () {
//        var numberFormatter : NSNumberFormatter = NSNumberFormatter()
//        numberFormatter.numberStyle = NSNumberFormatterStyle.NoStyle
//        numberFormatter.roundingMode = NSNumberFormatterRoundingMode.RoundDown
//        
//        screenInformation!.text = "\(UIDevice.currentDevice().model) · \(numberFormatter.stringFromNumber(UIScreen.mainScreen().bounds.width)!)×\(numberFormatter.stringFromNumber(UIScreen.mainScreen().bounds.height)!) pt"
//        screenInformation!.numberOfLines = 1
//    }
}