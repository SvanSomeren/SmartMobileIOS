//
//  bigViewController.swift
//  awesrdfghjk
//
//  Created by issd on 09/03/2018.
//  Copyright © 2018 issd. All rights reserved.
//

import UIKit

class bigViewController: UIViewController {

    @IBOutlet weak var labelBoi: UILabel!
    var textding = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        labelBoi.text = textding
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
