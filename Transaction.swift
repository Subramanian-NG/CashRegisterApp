//
//  Transaction.swift
//  CashRegisterApp
//
//  Created by user238111 on 3/2/24.
//

import Foundation

class Transaction
{
    var productName: String
    var quantity: Int
    var transactionTime: Date
    var amount: Double
    
    init(productName: String, quantity: Int, transactionTime: Date, amount: Double) {
        self.productName = productName
        self.quantity = quantity
        self.transactionTime = transactionTime
        self.amount = amount
    }
    
}
