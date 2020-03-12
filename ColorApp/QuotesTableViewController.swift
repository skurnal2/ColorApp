//
//  QuotesTableViewController.swift
//  ColorApp
//
//  Created by Siddharth Kurnal on 3/9/20.
//  Copyright © 2020 Siddharth Kurnal. All rights reserved.
//

import UIKit

class QuotesTableViewController: UITableViewController {

    let quoteManager = QuoteManager()
    
    
    @IBOutlet weak var quotesTableView: UITableView!
    
    @IBAction func loadData(_ sender: UIButton) {
        quotesTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }



    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "quoteCell", for: indexPath)
        
        cell.textLabel?.text = quoteManager.quoteList[indexPath.row].author
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return quoteManager.quoteList.count
    }

   

}
