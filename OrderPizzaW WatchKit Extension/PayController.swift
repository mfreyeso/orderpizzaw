//
//  PayController.swift
//  OrderPizzaW
//
//  Created by Mario on 30/07/16.
//  Copyright © 2016 Mario. All rights reserved.
//

import WatchKit
import Foundation


class PayController: WKInterfaceController {
    
    var resultPartial = OrderProduct()
    var paySelected :String = ""
    
    var payItems :[(String, String)] = [
        ("Item1", "Cash"),
        ("Item2", "Credit Card") ]
    
    
    @IBOutlet var payPicker: WKInterfacePicker!
    
    @IBAction func changeSelectPay(value: Int) {
        paySelected = payItems[value].1
    }
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        let d = context as! OrderProduct
        resultPartial.modifySizeProduct(d.sizeProduct)
        resultPartial.modifyDoughProduct(d.doughProduct)
        resultPartial.modifyCheeseProduct(d.cheeseProduct)
        resultPartial.modifyIngredientsProduct(d.ingredientsProduct)
        
    }

    @IBAction func paySelectedAction() {
        resultPartial.modifyPayOption(paySelected)
        pushControllerWithName("ConfirmationView", context: resultPartial)
        
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        let pickerItems :[WKPickerItem] = payItems.map{
            let pickerItem = WKPickerItem()
            pickerItem.title = $0.1
            pickerItem.caption = $0.0
            return pickerItem
        }
        payPicker.setItems(pickerItems)
        
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
