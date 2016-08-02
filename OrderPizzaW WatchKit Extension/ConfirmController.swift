//
//  ConfirmController.swift
//  OrderPizzaW
//
//  Created by Mario on 30/07/16.
//  Copyright © 2016 Mario. All rights reserved.
//

import WatchKit
import Foundation


class ConfirmController: WKInterfaceController {

    var ingredients = [String]()
    
    @IBOutlet var sizeLabel: WKInterfaceLabel!
    @IBOutlet var doughLabel: WKInterfaceLabel!
    @IBOutlet var payLabel: WKInterfaceLabel!
    @IBOutlet var tableIngredients: WKInterfaceTable!
    
    @IBAction func confirmAction() {
        pushControllerWithName("OrderFinal", context: OrderProduct())
    }
    
    
    func refreshTable(){
        //Set number of rows and the class of the rows
        tableIngredients.setNumberOfRows(ingredients.count, withRowType: "row")
        
        //Loop through the rows of the table and populate them with data
        for var index = 0; index < tableIngredients.numberOfRows; index++ {
            
            let row = tableIngredients.rowControllerAtIndex(index) as! IngredientFnRowController //get the row
            
            //Set the properties of the row Controller.
            row.ingredientLabel.setText(ingredients[index])
        }
        
        //Scroll to last table row.
        tableIngredients.scrollToRowAtIndex(tableIngredients.numberOfRows - 1)
    }
    
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        let d = context as! OrderProduct
        sizeLabel.setText(d.sizeProduct)
        doughLabel.setText(d.doughProduct)
        payLabel.setText(d.payOption)
        ingredients = d.ingredientsArray()

    }
    
    

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        refreshTable()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
