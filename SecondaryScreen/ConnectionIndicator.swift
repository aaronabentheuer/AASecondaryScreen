//
//  ConnectionIndicator.swift
//  SecondaryScreen
//
//  Created by Julian Abentheuer on 24.11.14.
//  Copyright (c) 2014 Aaron Abentheuer. All rights reserved.
//

import UIKit

class ConnectionIndicator: UIView {
    var redLight : UIView = UIView(frame: UIScreen.mainScreen().bounds)
    var yellowLight : UIView = UIView(frame: UIScreen.mainScreen().bounds)
    var greenLight : UIView = UIView(frame: UIScreen.mainScreen().bounds)
    var connectionStatusLabel : UILabel = UILabel(frame: UIScreen.mainScreen().bounds)
    
    override init() {
        super.init(frame: CGRectMake(0, 0, 55, 150))
        self.backgroundColor = UIColor(white: 1, alpha: 0.3)
        self.clipsToBounds = false
        self.layer.cornerRadius = 30
        self.layer.borderColor = UIColor.whiteColor().CGColor
        
        self.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        redLight.backgroundColor = UIColor.redColor()
        redLight.setTranslatesAutoresizingMaskIntoConstraints(false)
        redLight.layer.cornerRadius = 25
        redLight.layer.opacity = 0.25
        self.addSubview(redLight)
        
        yellowLight.backgroundColor = UIColor.yellowColor()
        yellowLight.setTranslatesAutoresizingMaskIntoConstraints(false)
        yellowLight.layer.cornerRadius = 25
        yellowLight.layer.opacity = 0.25
        self.addSubview(yellowLight)
        
        greenLight.backgroundColor = UIColor.greenColor()
        greenLight.setTranslatesAutoresizingMaskIntoConstraints(false)
        greenLight.layer.cornerRadius = 25
        greenLight.layer.opacity = 0.25
        self.addSubview(greenLight)
        
        connectionStatusLabel.textColor = UIColor.whiteColor()
        connectionStatusLabel.textAlignment = .Center
        connectionStatusLabel.sizeToFit()
        connectionStatusLabel.numberOfLines = 2
        connectionStatusLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.addSubview(connectionStatusLabel)
        
        if (UIDevice.currentDevice().userInterfaceIdiom == .Phone) {
            connectionStatusLabel.alpha = 0
        }
        
        self.addConstraints([NSLayoutConstraint(item: redLight, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Width, multiplier: 0, constant: 50), NSLayoutConstraint(item: redLight, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Height, multiplier: 0, constant: 50)])
        self.addConstraints([NSLayoutConstraint(item: yellowLight, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Width, multiplier: 0, constant: 50), NSLayoutConstraint(item: yellowLight, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Height, multiplier: 0, constant: 50)])
        self.addConstraints([NSLayoutConstraint(item: greenLight, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Width, multiplier: 0, constant: 50), NSLayoutConstraint(item: greenLight, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Height, multiplier: 0, constant: 50)])
        self.addConstraints([NSLayoutConstraint(item: redLight, attribute: NSLayoutAttribute.CenterY, relatedBy: .Equal, toItem: self, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: 0), NSLayoutConstraint(item: yellowLight, attribute: NSLayoutAttribute.CenterY, relatedBy: .Equal, toItem: self, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: 0), NSLayoutConstraint(item: greenLight, attribute: NSLayoutAttribute.CenterY, relatedBy: .Equal, toItem: self, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: 0)])
        self.addConstraints([NSLayoutConstraint(item: redLight, attribute: NSLayoutAttribute.LeftMargin, relatedBy: .Equal, toItem: self, attribute: NSLayoutAttribute.LeftMargin, multiplier: 1, constant: 5), NSLayoutConstraint(item: yellowLight, attribute: NSLayoutAttribute.CenterX, relatedBy: .Equal, toItem: self, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0), NSLayoutConstraint(item: greenLight, attribute: NSLayoutAttribute.RightMargin, relatedBy: .Equal, toItem: self, attribute: NSLayoutAttribute.RightMargin, multiplier: 1, constant: -5), NSLayoutConstraint(item: connectionStatusLabel, attribute: NSLayoutAttribute.CenterX, relatedBy: .Equal, toItem: self, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0), NSLayoutConstraint(item: connectionStatusLabel, attribute: NSLayoutAttribute.Top, relatedBy: .Equal, toItem: self, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 15)])
    }
    
    
    func indicateNoConnection () {
        var redLightAnimation : CABasicAnimation = CABasicAnimation(keyPath: "opacity")
        redLightAnimation.fromValue = 0.25
        redLightAnimation.toValue = 1
        redLightAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        redLightAnimation.duration = 1
        redLightAnimation.autoreverses = false
        redLightAnimation.removedOnCompletion = false
        redLightAnimation.fillMode = kCAFillModeBoth
        redLight.layer.addAnimation(redLightAnimation, forKey: "myAnimation")
        
        yellowLight.layer.removeAllAnimations()
        greenLight.layer.removeAllAnimations()
        connectionStatusLabel.text = "Connect to a secondary screen in “Control Center”."
    }
    
    func indicateCurrentlyInSetup () {
        var redLightAnimation : CABasicAnimation = CABasicAnimation(keyPath: "opacity")
        redLightAnimation.fromValue = 1
        redLightAnimation.toValue = 0.25
        redLightAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        redLightAnimation.duration = 1
        redLightAnimation.autoreverses = false
        redLightAnimation.removedOnCompletion = false
        redLightAnimation.fillMode = kCAFillModeBoth
        redLight.layer.addAnimation(redLightAnimation, forKey: "myAnimation")
        
        var yellowLightAnimation : CABasicAnimation = CABasicAnimation(keyPath: "opacity")
        yellowLightAnimation.fromValue = 1
        yellowLightAnimation.toValue = 0.25
        yellowLightAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        yellowLightAnimation.duration = 1
        yellowLightAnimation.repeatCount = HUGE
        yellowLightAnimation.autoreverses = true
        yellowLightAnimation.removedOnCompletion = false
        yellowLightAnimation.fillMode = kCAFillModeBoth
        yellowLight.layer.addAnimation(yellowLightAnimation, forKey: "myAnimation")
        
        connectionStatusLabel.text = "“Inactive” mode, probably to set up AirPlay.\nDon’t forget activating “Mirroring”."
    }
    
    func indicateConnectionEstablished () {
        var secondaryScreenViewController = SecondaryViewController()
        
        var greenLightAnimation : CABasicAnimation = CABasicAnimation(keyPath: "opacity")
        greenLightAnimation.fromValue = 0.25
        greenLightAnimation.toValue = 1
        greenLightAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        greenLightAnimation.duration = 1
        greenLightAnimation.autoreverses = false
        greenLightAnimation.removedOnCompletion = false
        greenLightAnimation.fillMode = kCAFillModeBoth
        greenLight.layer.addAnimation(greenLightAnimation, forKey: "myAnimation")
        
        yellowLight.layer.removeAllAnimations()
        redLight.layer.removeAllAnimations()
        
        var numberFormatter : NSNumberFormatter = NSNumberFormatter()
        numberFormatter.numberStyle = NSNumberFormatterStyle.NoStyle
        numberFormatter.roundingMode = NSNumberFormatterRoundingMode.RoundDown
        
        connectionStatusLabel.text = "You’re connected to your secondary screen."
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
