//
//  Product.swift
//  CashRegisterApp
//
//  Created by user238111 on 3/2/24.
//

import Foundation

class Product
{
    var name: String
    var price: Double
    var numbersAvailable: Int
    
    init(name: String, price: Double, numbersAvailable: Int) {
        self.name = name
        self.price = price
        self.numbersAvailable = numbersAvailable
    }
}
