//
//  RestockViewController.swift
//  CashRegisterApp
//
//  Created by user238111 on 3/3/24.
//

import UIKit

class RestockViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    var cashRegister: CashRegister = CashRegister()
    
    @IBOutlet weak var productsTable: UITableView!
    
    
    @IBOutlet weak var quantityText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Restock"
        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cashRegister.products.count
    }
    
    
    @IBAction func restockClicked(_ sender: Any) {
        var validationSuccess: Bool = true
        var alertMsg: String = ""
        let selectedRow = productsTable.indexPathForSelectedRow
        if (selectedRow == nil)
        {
           alertMsg = "You must select a product to restock"
            validationSuccess = false
        }
        
        if validationSuccess, let goodBoolean = quantityText.text?.isEmpty
        {
            if goodBoolean
            {
                alertMsg = "Quantity value is empty"
                validationSuccess = false
            }
        }
        if validationSuccess
        {
            var intString : Int? = Int(quantityText.text!)
            if let goodIntString = intString
            {
                if goodIntString < 0
                {
                    alertMsg = "Quantity value cannot be negative"
                    validationSuccess = false
                }
            }
            else
            {
                alertMsg = "Quantity value should be number"
                validationSuccess = false
            }
        }
        
        if !validationSuccess
        {
            let alert = UIAlertController(title: "Error", message: alertMsg, preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .cancel))
            present(alert, animated: true)
            return
        }
        
        cashRegister.processRestockAction(selectedProduct:cashRegister.products[selectedRow!.row],newQuantity:quantityText.text!,index: selectedRow!.row)
        quantityText.text = ""
        productsTable.reloadData()
    }
    
    
    @IBAction func onClickCancel(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "stockCell") as? StockTableViewCell
        cell?.productName.text = cashRegister.products[indexPath.row].name
        cell?.avaialbilityNumber.text = String(cashRegister.products[indexPath.row].numbersAvailable)
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70.0
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
