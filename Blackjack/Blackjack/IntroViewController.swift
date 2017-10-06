//
//  IntroViewController.swift
//  Blackjack
//
//  Created by Korman Chen on 10/6/17.
//  Copyright © 2017 Korman Chen. All rights reserved.
//

import UIKit
import os.log

class IntroViewController: UIViewController {

    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var welcomeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let button = sender as? UIButton, button == playButton else {
            os_log("The play button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
    }
    

}
