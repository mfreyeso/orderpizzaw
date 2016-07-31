//
//  DoughController.swift
//  OrderPizzaW
//
//  Created by Mario on 30/07/16.
//  Copyright © 2016 Mario. All rights reserved.
//

import WatchKit
import Foundation


class DoughController: WKInterfaceController {


    @IBAction func changeDough(value: Int) {
    }
    @IBOutlet var doughPicker: WKInterfacePicker!
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        let d = context as! OrderProduct
        print(d.sizeProduct)
        
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
