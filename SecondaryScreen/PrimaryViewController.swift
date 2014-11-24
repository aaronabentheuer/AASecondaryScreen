//
//  ViewController.swift
//  SecondScreen
//
//  Created by Julian Abentheuer on 10.11.14.
//  Copyright (c) 2014 Aaron Abentheuer. All rights reserved.
//

import UIKit

class PrimaryViewController: UIViewController {
    
    var connectionTrafficLights : ConnectionIndicator = ConnectionIndicator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blackColor()
        self.view.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        self.view.addSubview(connectionTrafficLights)
        self.view.addConstraints([NSLayoutConstraint(item: connectionTrafficLights, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0), NSLayoutConstraint(item: connectionTrafficLights, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: 0), NSLayoutConstraint(item: connectionTrafficLights, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Width, multiplier: 0, constant: 180), NSLayoutConstraint(item: connectionTrafficLights, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Height, multiplier: 0, constant: 60)])
        
        //Subscribing to a UIScreenDidConnect/DisconnectNotification to react to changes in the status of connected screens.
        var screenConnectionStatusChangedNotification = NSNotificationCenter.defaultCenter()
        screenConnectionStatusChangedNotification.addObserver(self, selector:("screenConnectionStatusChanged"), name:UIScreenDidConnectNotification, object:nil)
        screenConnectionStatusChangedNotification.addObserver(self, selector:("screenConnectionStatusChanged"), name:UIScreenDidDisconnectNotification, object:nil)
        
        //Subscribing to a UIApplicationWillResignActiveNotification allows you to react to the user entering some sort of inactive mode of the application. This fires when opening the iOS Notification Center, leaving the application by pressing the Home-Button or switching the application. It fires as well when opening ControlCenter, for example to activate AirPlay Mirroring. This user-interface often times is confusing, especially since you have to activate the "mirroring" option seperately to make the second-screen experience work. To assist the user you could implement an assistive view that displays whenever "UIApplicationWillResignActive" is called and is removed from the canvas once "UIApplicationDidBecomeActive" is called. Keep in mind however that you can not explicitely tell in which one of the possible "inactive"-modes the user is in, so it is kind of a hack and not really intended by Apple to do this. Only implement this if you are sure you know what you are doing and are able to come up with a user-interface that is subtle, helpful and doesn't hurt when it's also shown in the multitasking-switcher. You can also only show this if the user entered this state "unusually" often in a given time and therefore might need some help.
        var applicationStatusChangedNotification = NSNotificationCenter.defaultCenter()
        applicationStatusChangedNotification.addObserver(self, selector:("applicationWillResignActive:"), name:UIApplicationWillResignActiveNotification, object:nil)
        applicationStatusChangedNotification.addObserver(self, selector: ("applicationDidBecomeActive:"), name: UIApplicationDidBecomeActiveNotification, object: nil)
        
        screenConnectionStatusChanged()
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
        if (UIScreen.screens().count == 1) {
            connectionTrafficLights.indicateNoConnection()
        }   else {
            connectionTrafficLights.indicateConnectionEstablished()
        }
    }
    
    func applicationWillResignActive(application: UIApplication) {
        connectionTrafficLights.indicateCurrentlyInSetup()
    }
    
    func applicationDidBecomeActive(application: UIApplication) {
        self.screenConnectionStatusChanged()
    }
}