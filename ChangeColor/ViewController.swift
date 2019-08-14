//
//  ViewController.swift
//  ChangeColor
//
//  Created by John Heifetz on 13/08/2019.
//  Copyright © 2019 heif_team. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        let colorViewController = segue.source as! ColorViewController
        colorViewController.delegate = self
        colorViewController.updateColor()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let colorViewController = segue.destination as! ColorViewController
        colorViewController.colorFromViewController = view.backgroundColor
    }
}

extension ViewController: ColorDelegate {
    func updateColor(_ color: UIColor) {
        view.backgroundColor = color
    }
}
