//
//  StackRPN.swift
//  TP4calculatrice
//
//  Created by kerautret on 03/11/2016.
//  Copyright © 2016 lpi2m. All rights reserved.
//

import Foundation
class StackRPN {

  
  
  
  
  
  var myArray = [NSNumber]()
  func push(aNumber: NSNumber)
  {
    myArray.insert (aNumber, at: myArray.count )
  }
  
  func pop() -> NSNumber?
  {
    if myArray.count==0
    {
      return nil
    }
    let res = myArray.last
    myArray.remove(at: myArray.count-1)
    return res
  }
  
  func clear(){
    myArray.removeAll()
  }
  
  func getElementWith(shift: Int) -> NSNumber?
  {
    if myArray.count-shift-1 >= 0
    {
      return myArray[myArray.count-shift-1]
    }
    else
    {
      return nil
    }
  }
  
}
