//
//  TextViewController.swift
//  ColorApp
//
//  Created by Siddharth Kurnal on 2/5/20.
//  Copyright © 2020 Siddharth Kurnal. All rights reserved.
//

import UIKit

class TextViewController: UIViewController {

    
    var colorChosen : UIColor = UIColor.white //Default to white
    
    @IBOutlet weak var textOutput: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let strokeTextAttributes = [
            NSAttributedString.Key.strokeColor : UIColor.black,
            NSAttributedString.Key.foregroundColor : colorChosen,
            NSAttributedString.Key.strokeWidth : -4.0,
            NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 60)]
            as [NSAttributedString.Key : Any]
        
        textOutput.attributedText = NSMutableAttributedString(string: "SAMPLE", attributes: strokeTextAttributes)
        
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
