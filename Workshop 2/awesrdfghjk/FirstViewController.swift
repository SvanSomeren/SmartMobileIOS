//
//  FirstViewController.swift
//  awesrdfghjk
//
//  Created by issd on 09/03/2018.
//  Copyright © 2018 issd. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var textboi: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var DestScreen : bigViewController = segue.destination as! bigViewController
        DestScreen.textding = textboi.text!
    }
}

