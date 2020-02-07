//
//  ViewController.swift
//  ColorApp
//
//  Created by Siddharth Kurnal on 1/22/20.
//  Copyright © 2020 Siddharth Kurnal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var redSlider: UISlider!
    
    @IBOutlet weak var greenSlider: UISlider!
    
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var redTextbox: UITextField!
    
    @IBOutlet weak var greenTextbox: UITextField!
    
    @IBOutlet weak var blueTextbox: UITextField!

    @IBOutlet weak var sampleLabel: UILabel!
    
    @IBAction func testTextGo(_ sender: UIButton) {
        self.performSegue(withIdentifier: "textSegue", sender: self)
    }
    
    @IBAction func randomButton(_ sender: UIButton) {
        let randomRed = Int.random(in: 0 ..< 256)
        let randomGreen = Int.random(in: 0 ..< 256)
        let randomBlue = Int.random(in: 0 ..< 256)
        
        redSlider.value = Float(randomRed)
        greenSlider.value = Float(randomGreen)
        blueSlider.value = Float(randomBlue)
        
        changeColor(redSlider)
        changeColor(greenSlider)
        changeColor(blueSlider)
        
        changeBackgroundColor()
    }
    
    //This method changes Textbox value on slider change
    @IBAction func changeColor(_ sender: UISlider) {
        let position:Int = sender.tag
        
        updateTextbox(position)
        changeBackgroundColor()
    }
    
    @IBOutlet weak var colorView: UIView!
    
    @IBAction func changeNumber(_ sender: UITextField) {
        let position:Int = sender.tag
        
        updateSlider(position)
        changeBackgroundColor()
    }
    
    func changeBackgroundColor()
    {
        let colorChosen = getColorChosen()
        
        colorView.backgroundColor = colorChosen
    }
    
    //setting the initial values
    var currentFontSize : CGFloat = CGFloat(40)
    var currentText = "SAMPLE"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Setting some initial features to view
        colorView.layer.borderWidth = 6
        colorView.layer.borderColor = UIColor.gray.cgColor
        colorView.layer.backgroundColor = getColorChosen().cgColor
        
        setBoxText()
    }

    func setBoxText() {
        //Setting the display sample text attributes
        let textAttributes = [
            NSAttributedString.Key.strokeColor : UIColor.black,
            NSAttributedString.Key.foregroundColor : UIColor.white,
            NSAttributedString.Key.strokeWidth : -2.0,
            NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: currentFontSize)]
            as [NSAttributedString.Key : Any]
        
        sampleLabel.attributedText = NSMutableAttributedString(string: currentText, attributes: textAttributes)
    }
    
    //Custom Functions
    func updateTextbox(_ position: Int)
    {
        //Checking the position and updating the textbox
        if position == 0 {
            let red:Float = redSlider.value
            redTextbox.text = String(red)
        }
        else if position == 1 {
            let green:Float = greenSlider.value
            greenTextbox.text = String(green)
        }
        else if position == 2 {
            let blue:Float = blueSlider.value
            blueTextbox.text = String(blue)
        }
    }
    
    func updateSlider(_ position: Int)
    {
        //Checking the position and updating the slider vaule
        if position == 0 {
            let red:String = redTextbox.text!
            
            redSlider.setValue(Float(red)!, animated: true)
        }
        else if position == 1 {
            let green:String = greenTextbox.text!
            greenSlider.setValue(Float(green)!, animated: true)
        }
        else if position == 2 {
            let blue:String = blueTextbox.text!
            blueSlider.setValue(Float(blue)!, animated: true)
        }
    }
    
    // dismiss keyboard on touch outside textfield
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for txt in self.view.subviews {
            if txt.isKind(of: UITextField.self) && txt.isFirstResponder {
                txt.resignFirstResponder()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let textVC = segue.destination as? TextViewController
        textVC?.backColor = getColorChosen()
        textVC?.textFromMain = currentText
        textVC?.sizeFromMain = Int(currentFontSize)
    }
    
    func getColorChosen() -> UIColor {
        //Getting the colors from textfields
        let redVal:String = redTextbox.text!
        let greenVal:String = greenTextbox.text!
        let blueVal:String = blueTextbox.text!
        
        let red: CGFloat = CGFloat((redVal as NSString).doubleValue)/255
        let green: CGFloat = CGFloat((greenVal as NSString).doubleValue)/255
        let blue: CGFloat = CGFloat((blueVal as NSString).doubleValue)/255
        
        let colorChosen = UIColor.init(red: red, green: green, blue: blue, alpha: 1)
        return colorChosen
    }
    
    @IBAction func unwindTextVC(segue: UIStoryboardSegue)
    {
        let textVC = segue.source as? TextViewController
        //Checking if Go back or save changes button was pressed, if save changes is pressed, then getting the values and updating them here on this page.
        if(textVC?.tag == 1) {
           // destinationMessageLabel.text = destinationVC?.textfieldDestination.text
            currentFontSize = CGFloat(textVC?.sizeSliderValue.value ?? 40)
            currentText = (textVC?.textToSet.text!)!
            setBoxText()
        }
        
    }
    
    
}


