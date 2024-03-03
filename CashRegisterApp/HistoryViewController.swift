//
//  HistoryViewController.swift
//  CashRegisterApp
//
//  Created by user238111 on 3/3/24.
//

import UIKit

class HistoryViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    var transactions :[Transaction] = []
    
    
    @IBOutlet weak var transactionsTable: UITableView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        transactions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "transactionCell")
        cell?.textLabel!.text = transactions[indexPath.row].productName
        cell?.detailTextLabel!.text = String(transactions[indexPath.row].quantity)
        cell?.textLabel!.font = UIFont.systemFont(ofSize: 25)
        cell?.detailTextLabel!.font = UIFont.systemFont(ofSize: 20)
        return cell!
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "History Items"
        transactionsTable.reloadData()

        // Do any additional setup after loading the view.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? SingleTransactionViewController,
                let selectedIndexPath = transactionsTable.indexPathForSelectedRow {
                let selectedTransaction = transactions[selectedIndexPath.row]
            destinationVC.transaction = selectedTransaction
            }
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
