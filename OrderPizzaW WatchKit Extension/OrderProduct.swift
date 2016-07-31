//
//  OrderProduct.swift
//  OrderPizzaW
//
//  Created by Mario on 31/07/16.
//  Copyright © 2016 Mario. All rights reserved.
//

import WatchKit

class OrderProduct: NSObject {
    var sizeProduct:String = ""
    var doughProduct:String = ""
    var cheeseProduct:String = ""
    var ingredientsProduct:String = ""
    var payOption:String = ""
    
    func modifySizeProduct(p:String){
        sizeProduct = p
    }
    
    func modifyDoughProduct(p:String){
        doughProduct = p
    }
    
    func modifyCheeseProduct(p:String){
        cheeseProduct = p
    }
    
    func modifyIngredientsProduct(p:String){
        ingredientsProduct = p
    }
    
    func modifyPayOption(p:String){
        payOption = p
    }

}
