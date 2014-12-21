//
//  SecondaryViewController.swift
//  SecondScreen
//
//  Created by Julian Abentheuer on 10.11.14.
//  Copyright (c) 2014 Aaron Abentheuer. All rights reserved.
//

import UIKit

class SecondaryViewController: UIViewController {
    
    private var mirroredScreenResolution : CGRect?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blackColor()
        
        //Adding the exemplatory view to the canvas. If you do your own stuff delete this line so it won't interfere with your code.
        self.view.addSubview(showcaseView())
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    //MARK: EXEMPLATORY VIEW GENERATION
    //This is just the exemplatory view to demonstrate some basic things on the secondary screen and help you with testing your Apple-TV settings. Feel free to delete all of this whole method, as it just returns a UIView, which is instantiated in the viewDidLoad() method.
    private func showcaseView () -> UIView {
        
        var showcaseView : UIView = UIView(frame: self.view.frame)
        
        mirroredScreenResolution = (UIScreen.screens())[1].bounds  //Getting the resolution of the secondary screen as a CGRect. Keep in mind we can't use “UIScreen.mainScreen().mirroredScreen” here since the mainScreen doesn't mirror itself and therefore this will return nil.
        
        var fadeInOutAnimation : CABasicAnimation = CABasicAnimation(keyPath: "opacity")
        fadeInOutAnimation.fromValue = 1
        fadeInOutAnimation.toValue = 0.25
        fadeInOutAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        fadeInOutAnimation.duration = 1
        fadeInOutAnimation.autoreverses = true
        fadeInOutAnimation.repeatCount = HUGE
        fadeInOutAnimation.removedOnCompletion = false
        fadeInOutAnimation.fillMode = kCAFillModeBoth
        
        var canvasView : UIView = UIView(frame: mirroredScreenResolution!)
        canvasView.layer.borderColor = UIColor(hue: 167/360, saturation: 65/100, brightness: 1, alpha: 1).CGColor
        canvasView.layer.borderWidth = mirroredScreenResolution!.height/50
        
        canvasView.layer.addAnimation(fadeInOutAnimation, forKey: "myAnimation")
        
        showcaseView.addSubview(canvasView)
        
        var secondaryScreenGlyph : UIImageView = UIImageView(image: UIImage(named: "SecondScreenGlyph"))
        secondaryScreenGlyph.frame = CGRect(x:0, y:0, width: mirroredScreenResolution!.height/5, height: mirroredScreenResolution!.height/5)
        secondaryScreenGlyph.center = CGPointMake(mirroredScreenResolution!.width/2, mirroredScreenResolution!.height/2)
        
        showcaseView.addSubview(secondaryScreenGlyph)
        
        var numberFormatter : NSNumberFormatter = NSNumberFormatter()
        numberFormatter.numberStyle = NSNumberFormatterStyle.NoStyle
        numberFormatter.roundingMode = NSNumberFormatterRoundingMode.RoundDown
        
        var instructions : UILabel = UILabel(frame: CGRectMake(0, 0, 0, 0))
        instructions.text = "This is your mirrored secondary screen running at a resolution of \(numberFormatter.stringFromNumber(mirroredScreenResolution!.width)!)×\(numberFormatter.stringFromNumber(mirroredScreenResolution!.height)!) px. \n Take a look at “SecondaryViewController.swift” in the Xcode project to change its contents."
        instructions.numberOfLines = 2
        instructions.sizeToFit()
        instructions.center.x = mirroredScreenResolution!.width/2
        instructions.center.y = mirroredScreenResolution!.height/2 + secondaryScreenGlyph.frame.height/2 + 20
        instructions.textColor = UIColor.whiteColor()
        instructions.textAlignment = .Center
        
        showcaseView.addSubview(instructions)
        
        return showcaseView
    }
}
