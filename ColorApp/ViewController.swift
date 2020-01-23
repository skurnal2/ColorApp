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
        //Getting the colors from textfields
        let redVal:String = redTextbox.text!
        let greenVal:String = greenTextbox.text!
        let blueVal:String = blueTextbox.text!
        
        let red: CGFloat = CGFloat((redVal as NSString).doubleValue)/255
        let green: CGFloat = CGFloat((greenVal as NSString).doubleValue)/255
        let blue: CGFloat = CGFloat((blueVal as NSString).doubleValue)/255
        
        colorView.backgroundColor = UIColor.init(red: red, green: green, blue: blue, alpha: 1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Setting some initial features to view
        colorView.layer.borderWidth = 6
        colorView.layer.borderColor = UIColor.gray.cgColor
        colorView.layer.backgroundColor = UIColor.yellow.cgColor
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

}


