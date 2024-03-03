//
//  SingleTransactionViewController.swift
//  CashRegisterApp
//
//  Created by user238111 on 3/3/24.
//

import UIKit

class SingleTransactionViewController: UIViewController {

    
    
    var transaction: Transaction = Transaction(productName: "", quantity: 0, transactionTime: Date(), amount: 0.0)
    
    
    @IBOutlet weak var productName: UILabel!
    
    
    @IBOutlet weak var quantity: UILabel!
    
    
    @IBOutlet weak var time: UILabel!
    
    
    @IBOutlet weak var amount: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        productName.text = self.transaction.productName
        quantity.text = String(self.transaction.quantity)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        time.text = dateFormatter.string(from: self.transaction.transactionTime)
        amount.text = String(self.transaction.amount)
        
        self.title = "Transaction Details"
        // Do any additional setup after loading the view.
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
