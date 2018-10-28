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
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(transaction: Transaction) {
        self.descrip.text = transaction.description 
    }

}
