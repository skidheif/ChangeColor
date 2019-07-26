//  ViewController.swift
//  ChangeColor
//
//  Created by John Heifetz on 26/07/2019.
//  Copyright © 2019 heif_team. All rights reserved.

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var viewColorField: UIView!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var redTextField: UITextField!
    
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var greenTextField: UITextField!
    
    @IBOutlet var blueLabel: UILabel!
    @IBOutlet var blueSlider: UISlider!
    @IBOutlet var blueTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Setup red slider
        redSlider.value = 0.1
        redSlider.minimumValue = 0
        redSlider.maximumValue = 1
        redSlider.minimumTrackTintColor = .red
        redSlider.maximumTrackTintColor = .lightGray
        
        // Setup red label
        redLabel.font = redLabel.font.withSize(13)
        redLabel.textColor = .white
        redLabel.text = "Red:   " + String(redSlider.value)
        
        //Setup red text field
        redTextField.keyboardType = .decimalPad
        redTextField.text = String(redSlider.value)
        
        
        // Setup green slider
        greenSlider.value = 0.2
        greenSlider.minimumValue = 0
        greenSlider.maximumValue = 1
        greenSlider.minimumTrackTintColor = .green
        greenSlider.maximumTrackTintColor = .lightGray
        
        // Setup green label
        greenLabel.font = greenLabel.font.withSize(12)
        greenLabel.textColor = .white
        greenLabel.text = "Green:   " + String(greenSlider.value)
        
        //Setup green text field
        greenTextField.keyboardType = .decimalPad
        greenTextField.text = String(greenSlider.value)
        
        
        // Setup blue slider
        blueSlider.value = 0.3
        blueSlider.minimumValue = 0
        blueSlider.maximumValue = 1
        blueSlider.minimumTrackTintColor = .blue
        blueSlider.maximumTrackTintColor = .lightGray
        
        // Setup blue label
        blueLabel.font = blueLabel.font.withSize(13)
        blueLabel.textColor = .white
        blueLabel.text = "Blue:   " + String(blueSlider.value)
        
        //Setup blue text field
        blueTextField.keyboardType = .decimalPad
        blueTextField.text = String(blueSlider.value)
        
        //Setup modifyed keyboard
        self.addDoneButtonOnKeyboard()
        
        // Setup main view
        viewColorField.layer.cornerRadius = 15
        updateColor()

    }
    
    @IBAction func redSliderAction() {
        redTextField.text = String(format: "%.2f", redSlider.value)
        redLabel.text = "Red:   " + String(format: "%.2f", redSlider.value)
        updateColor()
    }
    
    @IBAction func greenSliderAction() {
        greenTextField.text = String(format: "%.2f", greenSlider.value)
        greenLabel.text = "Green:  " + String(format: "%.2f", greenSlider.value)
        updateColor()
    }
    @IBAction func blueSliderAction() {
        blueTextField.text = String(format: "%.2f", blueSlider.value)
        blueLabel.text = "Blue:  " + String(format: "%.2f", blueSlider.value)
        updateColor()
    }
    
    func updateColor(){
        let redAmount = CGFloat(redSlider.value)
        let greenAmount = CGFloat(greenSlider.value)
        let blueAmount = CGFloat(blueSlider.value)
        
        let color = UIColor(red: redAmount,
                            green: greenAmount,
                            blue: blueAmount,
                            alpha:  1.0)
        viewColorField.backgroundColor = color
    }
    
    func addDoneButtonOnKeyboard() {
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(
            x: 0,
            y: 0,
            width: UIScreen.main.bounds.width,
            height: 50))
        doneToolbar.barStyle = .default
        
        let flexSpace = UIBarButtonItem(
            barButtonSystemItem: .flexibleSpace,
            target: nil,
            action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(
            title: "Done",
            style: .done,
            target: self,
            action: #selector(self.doneButtonAction))
        
        let items = [flexSpace, done]
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        self.redTextField.inputAccessoryView = doneToolbar
        self.greenTextField.inputAccessoryView = doneToolbar
        self.blueTextField.inputAccessoryView = doneToolbar
    }
    
    @objc func doneButtonAction(){
        guard let redInputNumbersField = redTextField.text, !redInputNumbersField.isEmpty else { return }
        redSlider.value = Float(redInputNumbersField) as! Float
        redLabel.text = "Red:   " + String(format: "%.2f", redSlider.value)
        updateColor()
        
        guard let greenInputNumbersField = greenTextField.text, !greenInputNumbersField.isEmpty else { return }
        greenSlider.value = Float(greenInputNumbersField) as! Float
        greenLabel.text = "Green:   " + String(format: "%.2f", greenSlider.value)
        updateColor()
        
        guard let blueInputNumbersField = blueTextField.text, !blueInputNumbersField.isEmpty else { return }
        blueSlider.value = Float(blueInputNumbersField) as! Float
        blueLabel.text = "Blue:   " + String(format: "%.2f", blueSlider.value)
        updateColor()
        
        self.view.endEditing(true)
    }
}
