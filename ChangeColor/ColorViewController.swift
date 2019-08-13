//  ViewController.swift
//  ChangeColor
//
//  Created by John Heifetz on 26/07/2019.
//  Copyright © 2019 heif_team. All rights reserved.

import UIKit

class ColorViewController: UIViewController {
    
    //colorField
    @IBOutlet var viewColorField: UIView!
    
    //labels
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    //sliders
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    //textFields
    @IBOutlet var redTextField: UITextField!
    @IBOutlet var greenTextField: UITextField!
    @IBOutlet var blueTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup main view
        viewColorField.layer.cornerRadius = 15
        
        //Setup modifyed keyboard
        addDoneButtonOnKeyboard()
        
        setupLabel()
        setupSlider()
        setupTextFields()
        updateColor()
    
    }
    
    //Action for sliders
    @IBAction func redSliderAction() {
        redTextField.text = stringValue(from: redSlider)
        redLabel.text = stringValue(from: redSlider)
        updateColor()
    }
    
    @IBAction func greenSliderAction() {
        greenTextField.text = stringValue(from: greenSlider)
        greenLabel.text = stringValue(from: greenSlider)
        updateColor()
    }
    @IBAction func blueSliderAction() {
        blueTextField.text = stringValue(from: blueSlider)
        blueLabel.text = stringValue(from: blueSlider)
        updateColor()
    }
    
    //Функция установки цвета
    private func updateColor(){
        let color = UIColor(red: CGFloat(redSlider.value),
                            green: CGFloat(greenSlider.value),
                            blue: CGFloat(blueSlider.value),
                            alpha:  1.0)
        viewColorField.backgroundColor = color
    }
    
    private func setupLabel(){
        redLabel.text = String(redSlider.value)
        greenLabel.text = String(greenSlider.value)
        blueLabel.text = String(blueSlider.value)
    }
    
    
    private func setupSlider(){
        // Setup red slider
        redSlider.tintColor = .red
        redSlider.maximumTrackTintColor = .lightGray
        
        // Setup green slider
        greenSlider.tintColor = .green
        greenSlider.maximumTrackTintColor = .lightGray
        
        // Setup blue slider
        blueSlider.maximumTrackTintColor = .lightGray
    }
    
    private func setupTextFields() {
        //Setup red text field
        redTextField.keyboardType = .decimalPad
        redTextField.text = String(redSlider.value)
        
        //Setup green text field
        greenTextField.keyboardType = .decimalPad
        greenTextField.text = String(greenSlider.value)
        
        //Setup blue text field
        blueTextField.keyboardType = .decimalPad
        blueTextField.text = String(blueSlider.value)
    }
    
    private func stringValue(from slider: UISlider) -> String{
        return String(format: "%.2f", slider.value)
    }
    
    
    //Добавление кнопки Done на клавиатуру
    func addDoneButtonOnKeyboard() {
        let doneToolbar: UIToolbar = UIToolbar()
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

        redTextField.inputAccessoryView = doneToolbar
        greenTextField.inputAccessoryView = doneToolbar
        blueTextField.inputAccessoryView = doneToolbar
    }

    //Функция для кнопки Done
    @objc func doneButtonAction(){
        setValueInTextField()
        self.view.endEditing(true)
    }

    //Функция для скрытия клавиатуры по тапу и установки значения
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        setValueInTextField()
        view.endEditing(true)
    }

    //Функция для установки значения в textfield
    func setValueInTextField() {

        guard let redInputNumbersField = redTextField.text,
            !redInputNumbersField.isEmpty else { return }

        if let _ = Float(redInputNumbersField) {
            redSlider.value = Float(redInputNumbersField) as! Float
            if let text = redTextField.text, let value = Int(text), value > 1 {
                redSlider.value = 1
                redTextField.text = String(1)
            }
            redLabel.text = stringValue(from: redSlider)
            updateColor()
        } else {
            showAlert(title: "Wrong format!", message: "Please enter correct value")
        }

        guard let greenInputNumbersField = greenTextField.text, !greenInputNumbersField.isEmpty else { return }

        if let _ = Float(greenInputNumbersField) {
        greenSlider.value = Float(greenInputNumbersField) as! Float
            if let text = greenTextField.text, let value = Int(text), value > 1 {
                greenSlider.value = 1
                greenTextField.text = String(1)
            }
        greenLabel.text = stringValue(from: greenSlider)
        updateColor()
        } else {
            showAlert(title: "Wrong format!", message: "Please enter correct value")
        }

        guard let blueInputNumbersField = blueTextField.text, !blueInputNumbersField.isEmpty else { return }
        if let _ = Float(blueInputNumbersField) {
        blueSlider.value = Float(blueInputNumbersField) as! Float
            if let text = blueTextField.text, let value = Int(text), value > 1 {
                blueSlider.value = 1
                blueTextField.text = String(1)
            }
        blueLabel.text = stringValue(from: blueSlider)
        updateColor()
        }
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
