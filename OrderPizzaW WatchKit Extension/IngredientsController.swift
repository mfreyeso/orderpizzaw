//
//  IngredientsController.swift
//  OrderPizzaW
//
//  Created by Mario on 30/07/16.
//  Copyright © 2016 Mario. All rights reserved.
//

import WatchKit
import Foundation


class IngredientsController: WKInterfaceController {

    @IBOutlet var tableIngredients: WKInterfaceTable!
    
    var ingredients = ["Pineapple", "Ham", "Onion", "Pepper", "Anchovies", "Turkey", "Sausage", "Olives", "Pepperoni"]
    
    
    func refreshTable(){
        //Set number of rows and the class of the rows
        tableIngredients.setNumberOfRows(ingredients.count, withRowType: "row")
        
        //Loop through the rows of the table and populate them with data
        for var index = 0; index < tableIngredients.numberOfRows; index++ {
            
            let row = tableIngredients.rowControllerAtIndex(index) as! IngredientRowController //get the row
            
            //Set the properties of the row Controller.
            row.ingredientSwOutlet.setTitle(ingredients[index])
            row.ingredientSwOutlet.setOn(false)
        }
        
        //Scroll to last table row.
        tableIngredients.scrollToRowAtIndex(tableIngredients.numberOfRows - 1)
    }
    
    @IBAction func ingredientsSelectedAction() {
        let resultContext = OrderProduct()
        pushControllerWithName("PayView", context: resultContext)
    }
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
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
