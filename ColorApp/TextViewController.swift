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
    
    @IBOutlet weak var sizeSliderValue: UISlider!
    
    @IBAction func sizeSlider(_ sender: Any) {
        setTextBox(textString: textToSet.text!, fontSize: Float(sizeSliderValue.value))
    }
    @IBOutlet weak var textOutput: UILabel!
    
    @IBAction func changeText(_ sender: UIButton) {
        setTextBox(textString: textToSet.text!, fontSize: Float(sizeSliderValue.value))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTextBox(textString: "SAMPLE", fontSize: Float(sizeSliderValue.value))
        
        // Do any additional setup after loading the view.
    }
    
    func setTextBox(textString : String, fontSize : Float) {
        let textAttributes = [
            NSAttributedString.Key.strokeColor : UIColor.black,
            NSAttributedString.Key.foregroundColor : UIColor.white,
            NSAttributedString.Key.strokeWidth : -4.0,
            NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: CGFloat(Int(fontSize)))]
            as [NSAttributedString.Key : Any]
        textOutput.backgroundColor = backColor
        
        
        textOutput.attributedText = NSMutableAttributedString(string: textString, attributes: textAttributes)
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
