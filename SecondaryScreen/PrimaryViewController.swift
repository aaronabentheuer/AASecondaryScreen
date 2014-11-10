//
//  ViewController.swift
//  SecondScreen
//
//  Created by Julian Abentheuer on 10.11.14.
//  Copyright (c) 2014 Aaron Abentheuer. All rights reserved.
//

import UIKit

class PrimaryViewController: UIViewController {
    
    @IBOutlet weak var screenInformation: UILabel!
    @IBOutlet weak var canvasView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blackColor()
        self.setupInstructions()
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
    
    func setupInstructions () {
        var numberFormatter : NSNumberFormatter = NSNumberFormatter()
        numberFormatter.numberStyle = NSNumberFormatterStyle.NoStyle
        numberFormatter.roundingMode = NSNumberFormatterRoundingMode.RoundDown
        
        screenInformation.text = "\(UIDevice.currentDevice().model) · \(numberFormatter.stringFromNumber(UIScreen.mainScreen().bounds.width)!)×\(numberFormatter.stringFromNumber(UIScreen.mainScreen().bounds.height)!) pt"
        screenInformation.numberOfLines = 1
    }
}