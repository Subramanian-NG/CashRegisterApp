//
//  StockTableViewCell.swift
//  CashRegisterApp
//
//  Created by user238111 on 3/3/24.
//

import UIKit

class StockTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    @IBOutlet weak var productName: UILabel!
    

    @IBOutlet weak var avaialbilityNumber: UILabel!
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
