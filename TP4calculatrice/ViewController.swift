//
//  ViewController.swift
//  TP4calculatrice
//
//  Created by kerautret on 02/11/2016.
//  Copyright © 2016 lpi2m. All rights reserved.
//

import UIKit
import Foundation


class ViewController: UIViewController {

  
  
  @IBOutlet var myInputDisplayLabel: UILabel!

  
  
  
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
    print("clickMul")
    let a1 = myStack.getElementWith(shift: 0)?.doubleValue
    let a2 = myStack.getElementWith(shift: 1)?.doubleValue
    if a1 != nil && a2 != nil
    {
      myStack.push(aNumber: NSNumber(value: a1!*a2!))
    }
    displayStack()
  }
  
  
  
  
  @IBAction func clickDiv(sender: AnyObject){
       print("clickDiv")
  }
  @IBAction func clickMinus(sender: AnyObject){
       print("clickMinus")
    let val1 = myStack.getElementWith(shift: 0)!.doubleValue
    let val2 = myStack.getElementWith(shift: 1)!.doubleValue
    myStack.pop()
    myStack.pop()
    myStack.push(aNumber: NSNumber(value: val1-val2))
    displayStack()
  }
  @IBAction func clickAdd(sender: AnyObject){
       print("clickADd")
       let val1 = myStack.getElementWith(shift: 0)!.doubleValue
       let val2 = myStack.getElementWith(shift: 1)!.doubleValue
       myStack.pop()
       myStack.pop()
       myStack.push(aNumber: NSNumber(value: val1+val2))
       displayStack()
  }
  
  @IBAction func clickDrop(sender: AnyObject){
       print("clickDrop")
       myStack.pop()
       displayStack()

  }

  @IBAction func clickEnter(sender: AnyObject){
       print("clickEnter")
       let formatter = NumberFormatter()
       myStack.push(aNumber: formatter.number(from: myInputDisplayLabel.text!)!)
       displayStack()
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
        label?.text = "\(content)"
      }else{
        label?.text = "----"
      }
      i = i + 1
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    displayStack()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

