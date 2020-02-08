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
    var textFromMain : String = "SAMPLE"
    var sizeFromMain : Int = 40
    var thicknessFromMain : Int = 4

    @IBOutlet weak var textToSet: UITextField!
    
    @IBOutlet weak var sizeSliderValue: UISlider!
    
    @IBOutlet weak var borderThicknessSliderValue: UISlider!
    
    @IBAction func sizeSlider(_ sender: Any) {
        setTextBox(textString: textToSet.text!, fontSize: Int(Float(sizeSliderValue.value)), thickness: Int(borderThicknessSliderValue.value))
    }
    
    @IBAction func doneEditing(_ sender: UITextField) {
        textToSet.resignFirstResponder()
    }
    
    @IBAction func thicknessSlider(_ sender: UISlider) {
        setTextBox(textString: textToSet.text!, fontSize: Int(Float(sizeSliderValue.value)), thickness: Int(borderThicknessSliderValue.value))
    }
    
    @IBOutlet weak var textOutput: UILabel!
    
    @IBAction func changeText(_ sender: UIButton) {
        setTextBox(textString: textToSet.text!, fontSize: Int(Float(sizeSliderValue.value)), thickness: Int(borderThicknessSliderValue.value))
    }
    
    var tag = 1
    
    //this function runs before the segue is performed
    //Here, giving the tag value if save changes is pressed
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let barButton = sender as? UIBarButtonItem
        if barButton?.tag == 0 {
            tag = 0
        }
        else
        {
            tag = 1
        }
        
    }

    @IBAction func saveChanges(_ sender: UIBarButtonItem) {
        let alertController = UIAlertController(title: "Edit Text", message: "Are you sure you want to complete editing?", preferredStyle: .actionSheet)
        
        let noAction = UIAlertAction(title: "No", style: .destructive, handler: nil)
        
        let saveAction = UIAlertAction(title: "Yes", style: .default) { (action) in
            //Manually calling unwind segue (Manual unwind segue was created by control dragging  VC to exit)
            self.performSegue(withIdentifier: "saveChangesSegue", sender: action)
        }

        
        alertController.addAction(saveAction)
        alertController.addAction(noAction)
    
        present(alertController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Setting Initial Text on Box Label and Text Field
        //also setting the slider to value obtained from main page
        setTextBox(textString: textFromMain, fontSize: sizeFromMain, thickness: thicknessFromMain)
        textToSet.text = textFromMain
        sizeSliderValue.value = Float(sizeFromMain)
    }
    
    func setTextBox(textString : String, fontSize : Int, thickness : Int) {
        let textAttributes = [
            NSAttributedString.Key.strokeColor : UIColor.black,
            NSAttributedString.Key.foregroundColor : UIColor.white,
            NSAttributedString.Key.strokeWidth : -thickness,
            NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: CGFloat(fontSize))]
            as [NSAttributedString.Key : Any]
        textOutput.backgroundColor = backColor
        
        
        textOutput.attributedText = NSMutableAttributedString(string: textString, attributes: textAttributes)
    }

}
