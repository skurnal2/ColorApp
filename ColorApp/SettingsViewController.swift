//
//  SettingsViewController.swift
//  ColorApp
//
//  Created by user166663 on 4/11/20.
//  Copyright © 2020 Siddharth Kurnal. All rights reserved.
//

import UIKit
import AVFoundation

extension Notification.Name {
    static let enterForeground = Notification.Name("enterForeground")
}

@available(iOS 13.0, *)
class SettingsViewController: UIViewController {

    @objc func applicationWillEnterForeground(notification: Notification) {
        syncSettings()
    }
    
    @IBOutlet weak var nameTextValue: UITextField!
    @IBOutlet weak var ageSliderValue: UISlider!
    @IBOutlet weak var emailSwitchValue: UISwitch!
    
    func syncSettings() {
        nameTextValue.text = UserDefaults.standard.string(forKey: "person_name")
        ageSliderValue.value = UserDefaults.standard.float(forKey: "person_age")
        emailSwitchValue.isOn = UserDefaults.standard.bool(forKey: "send_email")
        
    }
    
    @IBAction func doneEditing(_ sender: UITextField) {
        nameTextValue.resignFirstResponder()
    }
    
    @IBAction func syncSettingsPressed(_ sender: UIButton) {
        syncSettings()
    }
    
    
    @IBAction func saveDetailsPressed(_ sender: UIButton) {
        UserDefaults.standard.set(nameTextValue.text, forKey: "person_name")
        UserDefaults.standard.set(ageSliderValue.value, forKey: "person_age")
        UserDefaults.standard.set(emailSwitchValue.isOn, forKey: "send_email")
    }
    
    @IBAction func readOut(_ sender: UIButton) {
        
        var choice: String = "out"
        if emailSwitchValue.isOn {
            choice = "in"
        }
        
        let text = "Your current name is \(nameTextValue.text ?? "not defined"), your age is \(Int(ageSliderValue.value)), and your have opted \(choice) for the email notifications."
        
         let utterance = AVSpeechUtterance(string: text)
               utterance.voice = AVSpeechSynthesisVoice(language: "en-GB")
               utterance.rate = 0.4
               
               let synthesizer = AVSpeechSynthesizer()
               synthesizer.speak(utterance)
        
    }
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        NotificationCenter.default.addObserver(self, selector: #selector(applicationWillEnterForeground(notification:)), name: UIScene.willEnterForegroundNotification, object: nil)
    }

}
