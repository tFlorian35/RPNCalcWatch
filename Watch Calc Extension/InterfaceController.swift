//
//  InterfaceController.swift
//  Watch Calc Extension
//
//  Created by Florian Tonnelier on 17/11/2016.
//  Copyright © 2016 lpi2m. All rights reserved.
//

import WatchKit
import Foundation



class InterfaceController: WKInterfaceController {
    @IBAction func recupResult() {
        print("Watch Button Pressed")
        let shareWithWatch = UserDefaults(suiteName:"group.lpi2m.TP4calculatrice")
        let lastResult = shareWithWatch?.object(forKey: "myKey")
        //print(lastResult!)
        displayLabel.setText(lastResult as! String?)
        
    }
    
   
    @IBOutlet var displayLabel: WKInterfaceLabel!
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    
    
    
    
}
