//
//  ViewController.swift
//  CalculatorUi
//
//  Created by Jack on 2018/11/26.
//  Copyright © 2018年 Jack. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayLabel: UILabel!
    @IBOutlet var btnCollection: [UIButton]!
    var tmp:String = ""
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        
        for i in 0...btnCollection.count - 1 {
            
            btnCollection[i].layer.cornerRadius = btnCollection[i].frame.size.width / 2
            btnCollection[i].clipsToBounds = true
        }
        
    }
    var tmpSave:String = ""
    var funMethod:Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func resetString(_ sender: Any) {
        
        tmp = ""
        tmpSave = "0"
        displayLabel.text! = "0"
        funMethod = nil
    }
    
    @IBAction func stringConnect(_ sender: UIButton) {
        
        tmp = tmp + sender.currentTitle!
        
        displayLabel.text! = tmp
        print(tmp)
    }
    @IBAction func funcAdd(_ sender: UIButton) {
        saveTmp()
        funMethod = 0
    
    }
    
    @IBAction func funcMinus(_ sender: UIButton) {
        saveTmp()
        funMethod = 1
        
    }
    @IBAction func funcMulti(_ sender: UIButton) {
        saveTmp()
        funMethod = 2

    }
    @IBAction func funcDivide(_ sender: UIButton) {
        saveTmp()
        funMethod = 3

    }
    
    @IBAction func answer(_ sender: UIButton) {
        
        
        switch funMethod {
        case nil: break
            
        case 0:
            tmp = String(format: "%.2f", Double(tmpSave)! + Double(tmp)!)
        case 1:
            tmp = String(format: "%.2f", Double(tmpSave)! - Double(tmp)!)

        case 2:
            tmp = String(format: "%.2f", Double(tmpSave)! * Double(tmp)!)
        case 3:
            tmp = String(format: "%.2f", Double(tmpSave)! / Double(tmp)!)
        default:
            break
        }
       
       displayLabel.text! = tmp
    }
    func saveTmp() {
        tmpSave = tmp
        tmp = ""
    }
}

