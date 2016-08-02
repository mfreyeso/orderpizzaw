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

    var resultPartial = OrderProduct()
    var ingredients = ["Pineapple", "Ham", "Onion", "Pepper", "Anchovies", "Turkey", "Sausage", "Olives", "Pepperoni"]
    
    var ingredientsSelectedFinal = [String]()
    
    @IBOutlet var tableIngredients: WKInterfaceTable!
    
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
    
    
    func validateIngredients(){
        var ingredientSelected = [String]()
        var countIngredients = 0
        for var index=0; index < tableIngredients.numberOfRows; index++ {
            let row = tableIngredients.rowControllerAtIndex(index) as! IngredientRowController
            if row.optionSelectedIngredient(){
                countIngredients += 1
                ingredientSelected.append(ingredients[index])
            }
        }
        
        if countIngredients > 5{
            // let h0 = { print("ok")}
            let action1 = WKAlertAction(title: "Approve", style: .Cancel){}
            presentAlertControllerWithTitle("Info", message: "Max 5 ingredients your choose", preferredStyle: .ActionSheet, actions: [action1])
        }
        else if countIngredients == 0 {
            // let h1 = { print("ok")}
            let action1 = WKAlertAction(title: "Approve", style: .Cancel){}
            presentAlertControllerWithTitle("Info", message: "Min 1 ingredient your choose", preferredStyle: .ActionSheet, actions: [action1])
        
        }
        ingredientsSelectedFinal = ingredientSelected
    }
    
    
    
    @IBAction func ingredientsSelectedAction() {
        validateIngredients()
        let resultContext = resultPartial
        resultContext.modifyIngredientsProduct(ingredientsSelectedFinal)
        pushControllerWithName("PayView", context: resultContext)
    }
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        let d = context as! OrderProduct
        resultPartial.modifySizeProduct(d.sizeProduct)
        resultPartial.modifyDoughProduct(d.doughProduct)
        resultPartial.modifyCheeseProduct(d.cheeseProduct)
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
