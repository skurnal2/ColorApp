//
//  TextViewController.swift
//  ColorApp
//
//  Created by Siddharth Kurnal on 2/5/20.
//  Copyright © 2020 Siddharth Kurnal. All rights reserved.
//

import UIKit

class TextViewController: UIViewController {
    
    var backColor : UIColor = UIColor.red //Default to white
    

    @IBOutlet weak var textToSet: UITextField!
    
    
    @IBOutlet weak var textOutput: UILabel!
    
    @IBAction func changeText(_ sender: UIButton) {
        setTextBox(textOutput.text!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let textAttributes = [
            NSAttributedString.Key.strokeColor : UIColor.black,
            NSAttributedString.Key.foregroundColor : UIColor.white,
            NSAttributedString.Key.strokeWidth : -4.0,
            NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 60)]
            as [NSAttributedString.Key : Any]
        textOutput.backgroundColor = backColor
        
        
        textOutput.attributedText = NSMutableAttributedString(string: "SAMPLE", attributes: textAttributes)
        
        // Do any additional setup after loading the view.
    }
    
    func setTextBox(_ text : String) {
        let textAttributes = [
            NSAttributedString.Key.strokeColor : UIColor.black,
            NSAttributedString.Key.foregroundColor : UIColor.white,
            NSAttributedString.Key.strokeWidth : -4.0,
            NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 60)]
            as [NSAttributedString.Key : Any]
        textOutput.backgroundColor = backColor
        
        
        textOutput.attributedText = NSMutableAttributedString(string: text, attributes: textAttributes)
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
