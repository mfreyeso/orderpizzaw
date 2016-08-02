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
    
    var resultPartial = OrderProduct()
    var doughSelected:String = ""
    var doughItems : [(String, String)] = [
        ("Item1", "Thin"),
        ("Item2", "Crisp"),
        ("Item3", "Thick")]
    
    @IBOutlet var doughPicker: WKInterfacePicker!
    
    
    @IBAction func pickerSelectedItemChanged(value: Int) {
        doughSelected = doughItems[value].1
    }
    
    @IBAction func doughSelectedAction() {
        resultPartial.modifyDoughProduct(doughSelected)
        pushControllerWithName("CheeseView", context: resultPartial)
    }
    
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        let d = context as! OrderProduct
        resultPartial.modifySizeProduct(d.sizeProduct)
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        let pickerItems : [WKPickerItem] = doughItems.map{
            let pickerItem = WKPickerItem()
            pickerItem.title = $0.1
            pickerItem.caption = $0.0
            return pickerItem
        }
        doughPicker.setItems(pickerItems)
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
