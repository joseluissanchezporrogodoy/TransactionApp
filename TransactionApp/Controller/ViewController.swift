//
//  ViewController.swift
//  TransactionApp
//
//  Created by jose.sanchezporro on 28/10/2018.
//  Copyright © 2018 jose.sanchezporro. All rights reserved.
//

import UIKit

class ViewController: UITableViewController{
   
    var transactions = [Transaction]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        DownloadDataInteractorImpl().execute(onSuccess: { (result: [Transaction]) in
            self.transactions = result
            self.tableView.reloadData()
        }) { (Error) in
            
        }
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactions.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell : TableViewCell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! TableViewCell
        cell.configure(transaction: transactions[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 165
    }
}

