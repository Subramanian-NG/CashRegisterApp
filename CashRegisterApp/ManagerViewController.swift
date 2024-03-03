//
//  ManagerViewController.swift
//  CashRegisterApp
//
//  Created by user238111 on 3/3/24.
//

import UIKit

class ManagerViewController: UIViewController {

    var cashRegister: CashRegister = CashRegister()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "historyView"{
                
                let historyVC = segue.destination as? HistoryViewController
                historyVC!.transactions = cashRegister.transactionBook.transactions
            }
        
        if segue.identifier == "restockView"{
            
            let restockVC = segue.destination as? RestockViewController
            restockVC!.cashRegister = cashRegister
        }
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
