//
//  TodayViewController.swift
//  TodayCalc
//
//  Created by kerautret on 10/11/2016.
//  Copyright © 2016 lpi2m. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view from its nib.
      self.extensionContext?.widgetLargestAvailableDisplayMode = NCWidgetDisplayMode.expanded
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        completionHandler(NCUpdateResult.newData)
    }

  func widgetActiveDisplayModeDidChange(_ activeDisplayMode: NCWidgetDisplayMode, withMaximumSize maxSize: CGSize) {
    if (activeDisplayMode == NCWidgetDisplayMode.compact) {
      self.preferredContentSize = maxSize
    }
    else {
      self.preferredContentSize = CGSize(width: maxSize.width, height: 400)
    }
  }

  
  
  
  @IBOutlet var myInputDisplayLabel: UILabel!
  
  
  @IBAction func clickFrac(sender: AnyObject) {
    if myStack.nbElements() > 1
    {
      if myStack.getElementWith(shift: 0) is NSNumber &&
        myStack.getElementWith(shift: 1) is NSNumber {
        let val1 = myStack.pop()!
        let val2 = myStack.pop()!
        let f = Fraction(aNumerateur: (val2 as! NSNumber).intValue , aDenominateur: (val1 as! NSNumber).intValue)
        myStack.push(aNumber: f as StackRPNCompatible)
        displayStack()
      }
    }
  }
  
  @IBOutlet var myLabelStack1: UILabel!
  @IBOutlet var myLabelStack2: UILabel!
  @IBOutlet var myLabelStack3: UILabel!
  @IBOutlet var myLabelStack4: UILabel!
  @IBOutlet var myLabelStack5: UILabel!
  
  let myStack = StackRPN()
  
  
  var hasPoint = false
  
  @IBAction func clickPoint(sender: AnyObject){
    print("clickPoint")
    if(myInputDisplayLabel.text == ""){
      myInputDisplayLabel.text?.append("0.")
      hasPoint = true
    }
    if !hasPoint {
      myInputDisplayLabel.text = "\(myInputDisplayLabel.text!)."
      hasPoint = true
    }
  }
  @IBAction func clickMul(sender: AnyObject){
    print("clickMinus")
    if myStack.nbElements() > 1
    {
      let val1 = myStack.pop()!.doubleValue
      let val2 = myStack.pop()!.doubleValue
      myStack.push(aNumber: NSNumber(value: val2*val1))
    }
    displayStack()
    
  }
  
  
  
  
  @IBAction func clickDiv(sender: AnyObject){
    print("clickDiv")
    print("clickMinus")
    if myStack.nbElements() > 1
    {
      let val1 = myStack.pop()!.doubleValue
      let val2 = myStack.pop()!.doubleValue
      myStack.push(aNumber: NSNumber(value: val2/val1))
    }
    displayStack()
    
    
  }
  @IBAction func clickMinus(sender: AnyObject){
    print("clickMinus")
    let val1 = myStack.pop()!.doubleValue
    let val2 = myStack.pop()!.doubleValue
    myStack.push(aNumber: NSNumber(value: val2-val1))
    displayStack()
  }
  
  
  
  @IBAction func clickAdd(sender: AnyObject){
    print("clickADd")
    if myStack.nbElements() > 1
    {
      let val1 = myStack.pop()!.doubleValue
      let val2 = myStack.pop()!.doubleValue
      myStack.push(aNumber: NSNumber(value: val2-val1))
    }
    displayStack()
  }
  
  @IBAction func clickDrop(sender: AnyObject){
    print("clickDrop")
    _ = myStack.pop()
    displayStack()
    
  }
  
  @IBAction func clickEnter(sender: AnyObject){
    print("clickEnter")
    let formatter = NumberFormatter()
    if let n = formatter.number(from: myInputDisplayLabel.text!)
      {
        myStack.push(aNumber: n)
        displayStack()
      }
    myInputDisplayLabel.text=""
  }
  
  @IBAction func clickDigit(sender: AnyObject){
    let tag = (sender as! UIButton).tag
    print("clickDigit tag \(tag)")
    myInputDisplayLabel.text = "\(myInputDisplayLabel.text!)\(tag)"
  }
  
  
  func displayStack()
  {
    let tabLab = [myLabelStack1,myLabelStack2, myLabelStack3, myLabelStack4, myLabelStack5]
    var i = 0
    for label in  tabLab {
      
      if let content = myStack.getElementWith(shift: i) {
        label?.text = "\(content.stringValue)"
      }else{
        label?.text = "----"
      }
      i = i + 1
    }
  }

  
  
}
