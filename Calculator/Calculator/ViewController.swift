//
//  ViewController.swift
//  Calculator
//
//  Created by Егор Куракин on 05.12.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelResoult: UILabel!
    @IBOutlet var buttons: [UIButton]!
    var labelNumber: Double = 0
    var oneResoult: Double = 0
    var operation: Int  = 0
    var matFinc = false
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in buttons.indices {
            buttons[i].layer.cornerRadius = 42.5
        }
        
    }

    @IBAction func clickDigits(_ sender: UIButton) {
        
        printLabel(sender.tag)
    }
    
    @IBAction func clickButtons(_ sender: UIButton) {
        if (labelResoult.text != "" && sender.tag != 14 && sender.tag != 15)
        {
            oneResoult = Double(labelResoult.text!)!
            switch sender.tag {
            case 10: //Деление
                labelResoult.text = "/"
                break
            case 11: //Умножение
                labelResoult.text = "x"
                break
            case 12: //Минус
                labelResoult.text = "-"
                break
            case 13: //Плюс
                labelResoult.text = "+"
                break
            default:
                 
                break
            }
            operation = sender.tag
            matFinc = true
            
        }
        else if sender.tag == 14
        {
            switch operation {
            case 10: //Деление
                labelResoult.text = String(oneResoult / labelNumber)
                break
            case 11: //Умножение
                labelResoult.text = String(oneResoult * labelNumber)
                break
            case 12: //Минус
                labelResoult.text = String(oneResoult - labelNumber)
                break
            case 13: //Плюс
                labelResoult.text = String(oneResoult + labelNumber)
                break
            default:
                break
            }
        }
        else if sender.tag == 15
        {
            oneResoult = 0
            labelNumber = 0
            operation = 0
            labelResoult.text = ""
        }
        
    }
    func printLabel(_ sender: Int)
    {
        if matFinc{
            labelResoult.text = String(sender)
            matFinc = false
        }
        else{
            labelResoult.text = labelResoult.text! + String(sender)
        }
        labelNumber = Double(labelResoult.text!)!
    }
}

