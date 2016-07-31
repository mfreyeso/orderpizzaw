//
//  InterfaceController.swift
//  OrderPizzaW WatchKit Extension
//
//  Created by Mario on 30/07/16.
//  Copyright © 2016 Mario. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    
    var sizeSelected:String = ""
    
    var sizeItems: [(String, String)] = [
        ("Item1", "Small"),
        ("Item2", "Medium"),
        ("Item3", "Large") ]
    
    
    @IBOutlet var sizePicker: WKInterfacePicker!
    
    @IBAction func sizeSelectedAction() {
        let resultContext = OrderProduct()
        resultContext.modifySizeProduct(sizeSelected)
        pushControllerWithName("DoughView", context: resultContext)
    }
    
    @IBAction func pickerSelectedItemChanged(value: Int) {
        print(sizeItems[value].1)
        sizeSelected = sizeItems[value].1
    }
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        let pickerItems : [WKPickerItem] =  sizeItems.map{
            let pickerItem = WKPickerItem()
            pickerItem.title = $0.1
            pickerItem.caption = $0.0
            return pickerItem
        }
        
        sizePicker.setItems(pickerItems)
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
}
