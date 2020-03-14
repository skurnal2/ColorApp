//
//  QuotesTableViewController.swift
//  ColorApp
//
//  Created by Siddharth Kurnal on 3/9/20.
//  Copyright © 2020 Siddharth Kurnal. All rights reserved.
//

import UIKit

class QuotesTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let quoteManager = QuoteManager()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quoteManager.quoteList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "quoteCell", for: indexPath)
        
        cell.textLabel?.text = quoteManager.quoteList[indexPath.row]
        
        
        return cell
    }
    
    
    
    
    
    @IBOutlet weak var quotesTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        quoteManager.fetchQuotes {
            self.quotesTableView.reloadData()
        }
    }
}
