//
//  ViewController.swift
//  ASOption
//
//  Created by Amit Mondol on 01/30/2022.
//  Copyright (c) 2022 Amit Mondol. All rights reserved.
//

import UIKit
import ASOption

class ViewController: UIViewController {

    @IBOutlet weak var alertButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func alert(_ sender: UIButton) {
        ASOption.show(sender, [ASOptionMesage("", "Alert!")], true, true, CGPoint(x: 10, y: 10))
    }
}

