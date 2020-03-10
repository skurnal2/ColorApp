//
//  PickerViewController.swift
//  ColorApp
//
//  Created by Siddharth Kurnal on 3/6/20.
//  Copyright © 2020 Siddharth Kurnal. All rights reserved.
//

import UIKit

class PickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    //setting the initial values
    var currentFontSize : CGFloat = CGFloat(40)
    var currentText = "SAMPLE"
    var currentThickness = 4;
    var textColor = UIColor.white
    
    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet weak var sampleLabel: UILabel!
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 10
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(row+1)
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let chosenColor = getChosenColor(red: pickerView.selectedRow(inComponent: 0), green: pickerView.selectedRow(inComponent: 1), blue: pickerView.selectedRow(inComponent: 2))
        
        //setting the textColor and calling method to load the text
        textColor = chosenColor
        setBoxText()
    }
    
    func getChosenColor(red: Int, green: Int, blue: Int) -> UIColor {
        let red: CGFloat = CGFloat(red)/10
        let green: CGFloat = CGFloat(green)/10
        let blue: CGFloat = CGFloat(blue)/10
        
        let colorChosen = UIColor.init(red: red, green: green, blue: blue, alpha: 1)
        return colorChosen
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    //Call this method when tab bar is selcted
    
    
    func setBoxText() {
        //Setting the display sample text attributes
        let textAttributes = [
            NSAttributedString.Key.strokeColor : UIColor.black,
            NSAttributedString.Key.foregroundColor : textColor,
            NSAttributedString.Key.strokeWidth : -currentThickness,
            NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: currentFontSize)]
            as [NSAttributedString.Key : Any]
        
        sampleLabel.attributedText = NSMutableAttributedString(string: currentText, attributes: textAttributes)
        
        //Also setting the value in delegate
        AppDelegate.shared().currentTextColor = textColor
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewLoadSetup()
    }
    
    func viewLoadSetup() {
        //Setting some initial features to view
        colorView.layer.borderWidth = 6
        colorView.layer.borderColor = UIColor.gray.cgColor
        colorView.layer.backgroundColor = AppDelegate.shared().currentBackgroundColor.cgColor
        
        //Getting values from View Delegate
        currentThickness = AppDelegate.shared().currentThickness
        currentText = AppDelegate.shared().currentText
        currentFontSize = AppDelegate.shared().currentFontSize
        
        //Setting the text in View Box
        setBoxText()
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
