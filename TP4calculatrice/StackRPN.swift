//
//  StackRPN.swift
//  TP4calculatrice
//
//  Created by kerautret on 03/11/2016.
//  Copyright © 2016 lpi2m. All rights reserved.
//

import Foundation

protocol StackRPNCompatible {
  var doubleValue: Double {get}
  var stringValue: String {get}
}

extension NSNumber: StackRPNCompatible{
  
}

class StackRPN {

  
  
  func nbElements()-> Int
  {
    return myArray.count
  }
  
  
  
  var myArray = [StackRPNCompatible]()
  func push(aNumber: StackRPNCompatible)
  {
    myArray.insert (aNumber, at: myArray.count )
  }
  
  func pop() -> StackRPNCompatible?
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
  
  func getElementWith(shift: Int) -> StackRPNCompatible?
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
