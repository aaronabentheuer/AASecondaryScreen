//
//  AppDelegate.swift
//  SecondScreen
//
//  Created by Julian Abentheuer on 10.11.14.
//  Copyright (c) 2014 Aaron Abentheuer. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var secondaryWindow: UIWindow?
    
    var primaryViewController : PrimaryViewController = PrimaryViewController(nibName: "PrimaryViewController", bundle: nil)
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        //Subscribing to a UIScreenDidConnect/DisconnectNotification to react to changes in the status of connected screens.
        var screenConnectionStatusChangedNotificationCenter = NSNotificationCenter.defaultCenter()
        screenConnectionStatusChangedNotificationCenter.addObserver(self, selector:("screenConnectionStatusChanged"), name:UIScreenDidConnectNotification, object:nil)
        screenConnectionStatusChangedNotificationCenter.addObserver(self, selector:("screenConnectionStatusChanged"), name:UIScreenDidDisconnectNotification, object:nil)
        
        //Initial check on how many screens are connected to the device on launch of the application.
        if (UIScreen.screens().count > 1) {
            self.screenConnectionStatusChanged()
        }
        
        return true
    }
    
    //Managing connection and disconnection of screens.
    func screenConnectionStatusChanged () {
        if (UIScreen.screens().count == 1) {
            secondaryWindow!.rootViewController = nil
            
        }   else {
            var screens : Array = UIScreen.screens()
            var newScreen : AnyObject! = screens.last
            
            secondaryScreenSetup(newScreen as UIScreen)
            secondaryWindow!.rootViewController = SecondaryViewController(nibName: "SecondaryViewController", bundle: nil)
            secondaryWindow!.makeKeyAndVisible()
        }
    }
    
    //Setup of secondary screen.
    func secondaryScreenSetup (screen : UIScreen) {
        var newWindow : UIWindow = UIWindow(frame: screen.bounds)
        newWindow.screen = screen
        newWindow.hidden = false
        
        secondaryWindow = newWindow
    }
    
    func applicationWillResignActive(application: UIApplication) {
    }
    
    func applicationDidEnterBackground(application: UIApplication) {
    }
    
    func applicationWillEnterForeground(application: UIApplication) {
    }
    
    func applicationDidBecomeActive(application: UIApplication) {
    }
    
    func applicationWillTerminate(application: UIApplication) {
    }
}