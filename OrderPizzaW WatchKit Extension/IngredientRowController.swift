//
//  IngredientRowController.swift
//  OrderPizzaW
//
//  Created by Mario on 1/08/16.
//  Copyright © 2016 Mario. All rights reserved.
//

import WatchKit

class IngredientRowController: NSObject {
    
    var valSelected :Bool = false
    @IBOutlet var ingredientSwOutlet: WKInterfaceSwitch!

    @IBAction func ingredientSwitchAction(value: Bool) {
        valSelected = value
    }
    
    func optionSelectedIngredient() -> Bool {
        return valSelected
    }
    
}
