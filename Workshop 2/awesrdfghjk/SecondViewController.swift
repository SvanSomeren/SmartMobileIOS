//
//  SecondViewController.swift
//  awesrdfghjk
//
//  Created by issd on 09/03/2018.
//  Copyright © 2018 issd. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var labeld: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func dsda(_ sender: Any) {
        labeld.text = String(arc4random_uniform(100));
    }
}

