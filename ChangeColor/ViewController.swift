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
        redLabel.font = redLabel.font.withSize(12)
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
        greenLabel.font = greenLabel.font.withSize(11)
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
        blueLabel.font = blueLabel.font.withSize(12)
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
    
    //Action для слайдеров
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
    
    //Функция установки цвета
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
    
    //Добавление кнопки Done на клавиатуру
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
    
    //Функция для кнопки Done
    @objc func doneButtonAction(){
        setColorValueInTextField()
        self.view.endEditing(true)
    }
    
    //Функция для скрытия клавиатуры по тапу и установки значения
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        setColorValueInTextField()
        view.endEditing(true)
    }
    
    //Функция для установки значения в textfield
    func setColorValueInTextField() {
        
        guard let redInputNumbersField = redTextField.text,
            !redInputNumbersField.isEmpty else { return }
        
        if let _ = Float(redInputNumbersField) {
            redSlider.value = Float(redInputNumbersField) as! Float
            if redSlider.value > 1 {
                redSlider.value = 1
            }
            redLabel.text = "Red:   " + String(format: "%.2f", redSlider.value)
            updateColor()
        } else {
            showAlert(title: "Wrong format!", message: "Please enter correct value")
        }
        
        guard let greenInputNumbersField = greenTextField.text, !greenInputNumbersField.isEmpty else { return }
        
        if let _ = Float(greenInputNumbersField) {
        greenSlider.value = Float(greenInputNumbersField) as! Float
            if greenSlider.value > 1 {
                greenSlider.value = 1
            }
        greenLabel.text = "Green:   " + String(format: "%.2f", greenSlider.value)
        updateColor()
        } else {
            showAlert(title: "Wrong format!", message: "Please enter correct value")
        }
        
        guard let blueInputNumbersField = blueTextField.text, !blueInputNumbersField.isEmpty else { return }
        if let _ = Float(blueInputNumbersField) {
        blueSlider.value = Float(blueInputNumbersField) as! Float
            if blueSlider.value > 1 {
                blueSlider.value = 1
            }
        blueLabel.text = "Blue:   " + String(format: "%.2f", blueSlider.value)
        updateColor()
        }
    }
    
    //Показ алерта при ошибке
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
