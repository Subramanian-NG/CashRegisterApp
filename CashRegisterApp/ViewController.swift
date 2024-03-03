//
//  ViewController.swift
//  CashRegisterApp
//
//  Created by user238111 on 3/2/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var cashRegister = CashRegister()
    
    
    @IBOutlet weak var productsTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Cash Register App"
        cashRegister.loadProducts()
        selectedProductLabel.isHidden = true
        quantityLabel.isHidden = true
        productsTable.isScrollEnabled = true
    }
    
    
    @IBOutlet weak var selectedProduct: UILabel!
    
    
    @IBOutlet weak var selectedQuantity: UILabel!
    
    
    @IBOutlet weak var amount: UILabel!
    
    
    @IBOutlet weak var selectedProductLabel: UILabel!
    
    
    @IBOutlet weak var quantityLabel: UILabel!
    
    
    @IBAction func clearClicked(_ sender: Any) {
       clearData()
    }
    
    
    
    @IBAction func numberClicked(_ sender: Any) {
        let selectedRow = productsTable.indexPathForSelectedRow
        if (selectedRow == nil)        {
            let alert = UIAlertController(title: "Error", message: "You must select a product to perform any operation", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .cancel))
            present(alert, animated: true)
            return
        }
        var clickedButton = sender as! UIButton
        if let goodValue = clickedButton.titleLabel?.text
        {
            selectedQuantity.text = "\(selectedQuantity.text!)\(goodValue)"
            if let goodDoubleValue = selectedQuantity.text
            {
                var selectedProductPrice = cashRegister.products[selectedRow!.row].price
                var totalValue = selectedProductPrice * Double(goodDoubleValue)!
                amount.text = String(totalValue)
            }
        }
        
    }
    
    @IBAction func processBuyAction(_ sender: Any) {
        let selectedRow = productsTable.indexPathForSelectedRow
        var validationSuccess: Bool = true
        var validationMsg: String = ""
        if (selectedRow == nil)
        {
            validationMsg = "You must select a product to perform any operation"
            validationSuccess = false
        }
        
        if validationSuccess
        {
            var selectedProductFromTable: Product = cashRegister.products[selectedRow!.row]
            var selectedQuatityInt: Int = Int(selectedQuantity.text!)!
            if (selectedQuatityInt > selectedProductFromTable.numbersAvailable)
            {
                validationMsg = "The selected quantity is more than the available quantity"
                validationSuccess = false
                amount.text = ""
                selectedQuantity.text = ""
            }
        }
        
        if !validationSuccess
        {
            let alert = UIAlertController(title: "Error", message: validationMsg, preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .cancel))
            present(alert, animated: true)
            return
            
        }
        var selectedProductFromTable: Product = cashRegister.products[selectedRow!.row]
        
        cashRegister.processBuyAction(selectedProduct:selectedProductFromTable,selectedQuantity:selectedQuantity.text!, index: selectedRow!.row)
        clearData()
        productsTable.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cashRegister.products.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? ProductTableViewCell
        cell?.productName.text = cashRegister.products[indexPath.row].name
        cell?.productPrice.text = String(cashRegister.products[indexPath.row].price)
        cell?.productAvailability.text = String(cashRegister.products[indexPath.row].numbersAvailable)
        return cell!
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedProductFromTable = cashRegister.products[indexPath.row]
        selectedProductLabel.isHidden = false
        quantityLabel.isHidden = false
        selectedProduct.text = selectedProductFromTable.name
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func clearData() -> Void{
        selectedProduct.text = ""
        selectedQuantity.text = ""
        amount.text = ""
        selectedProductLabel.isHidden = true
        quantityLabel.isHidden = true
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "managerView"{
                
                let managerVC = segue.destination as? ManagerViewController
                managerVC?.cashRegister = cashRegister
            }
            
    }
    
    override func viewWillAppear(_ animated: Bool) {
        productsTable.reloadData()
    }
    
}

