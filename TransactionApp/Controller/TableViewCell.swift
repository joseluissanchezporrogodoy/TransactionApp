//
//  TableViewCell.swift
//  TransactionApp
//
//  Created by jose.sanchezporro on 28/10/2018.
//  Copyright © 2018 jose.sanchezporro. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {


    @IBOutlet weak var descrip: UILabel!
    
    @IBOutlet weak var date: UILabel!
    
    @IBOutlet weak var amount: UILabel!
    
    @IBOutlet weak var fee: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(transaction: Transaction) {
        self.descrip.text = "Description: " + (transaction.description ?? "No desc")
        self.date.text = "Date: " + (transaction.date ?? "No Date")
        self.amount.text = "Amount: " + (String(transaction.amount ?? 0))
        self.fee.text = "Fee: " + (String(transaction.fee ?? 0))
    }
}
