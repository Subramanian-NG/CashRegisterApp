//
//  CashRegister.swift
//  CashRegisterApp
//
//  Created by user238111 on 3/2/24.
//

import Foundation
import UIKit

class CashRegister
{
    var currentTotalValue: Double = 0.0
    var transactionBook = TransactionBook(transactions: [])
    var products:[Product] = []
    func loadProducts() -> Void
    {
        products.append(Product(name: "hats", price: 10.5, numbersAvailable: 50))
        products.append(Product(name: "shoes", price: 20.0, numbersAvailable: 20))
        products.append(Product(name: "pants", price: 15.0, numbersAvailable: 50))
        products.append(Product(name: "toys", price: 5.5, numbersAvailable: 30))
        //products.append(Product(name: "hats", price: 10.5, numbersAvailable: 50))
        //roducts.append(Product(name: "hats", price: 10.5, numbersAvailable: 50))
        //products.append(Product(name: "hats", price: 10.5, numbersAvailable: 50))
    }
    
    func processBuyAction(selectedProduct:Product, selectedQuantity: String, index :Int) -> Void
    {
        let transactionValue = selectedProduct.price * Double(selectedQuantity)!
        selectedProduct.numbersAvailable = selectedProduct.numbersAvailable - Int(selectedQuantity)!
        self.transactionBook.transactions.append(Transaction(productName: selectedProduct.name, quantity: Int(selectedQuantity)!, transactionTime: Date(), amount: transactionValue))
        //remove from product list when stock availability is 0
        if selectedProduct.numbersAvailable == 0
        {
            products.remove(at: index)
        }
    }
    
    func processRestockAction(selectedProduct:Product, newQuantity: String, index: Int) -> Void
    {
        selectedProduct.numbersAvailable = Int(newQuantity)!
        
        //remove from product list when stock availability is 0
        if selectedProduct.numbersAvailable == 0
        {
            products.remove(at: index)
        }
    }}
