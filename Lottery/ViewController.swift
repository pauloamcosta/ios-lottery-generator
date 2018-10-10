//
//  ViewController.swift
//  Lottery
//
//  Created by Paulo Costa on 09/10/2018.
//  Copyright © 2018 Paulo Costa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lbGameType: UILabel!
    @IBOutlet weak var scGameType: UISegmentedControl!
    @IBOutlet var ball: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func generateGame() {
    }
    
}

