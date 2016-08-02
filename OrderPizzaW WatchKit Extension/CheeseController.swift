//
//  CheeseController.swift
//  OrderPizzaW
//
//  Created by Mario on 30/07/16.
//  Copyright © 2016 Mario. All rights reserved.
//

import WatchKit
import Foundation


class CheeseController: WKInterfaceController {

    var resultPartial = OrderProduct()
    var cheeseSelected:String = ""
    
    var cheeseItems: [(String, String)] = [
        ("Item1", "Mozarella"),
        ("Item2", "Cheddar"),
        ("Item3", "Parmesan"),
        ("Item4", "No Cheese")]
    
    @IBOutlet var cheesePicker: WKInterfacePicker!
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        let d = context as! OrderProduct
        resultPartial.modifySizeProduct(d.sizeProduct)
        resultPartial.modifyDoughProduct(d.doughProduct)
       
        // Configure interface objects here.
    }

    @IBAction func changeCheese(value: Int) {
        cheeseSelected = cheeseItems[value].1
    }
    
    @IBAction func cheeseSelectedAction() {
        resultPartial.modifyCheeseProduct(cheeseSelected)
        pushControllerWithName("IngredientsView", context: resultPartial)
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        let pickerItems: [WKPickerItem] = cheeseItems.map{
            let pickerItem = WKPickerItem()
            pickerItem.title = $0.1
            pickerItem.caption = $0.0
            return pickerItem
        }
        cheesePicker.setItems(pickerItems)
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
