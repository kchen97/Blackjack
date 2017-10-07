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
    @IBOutlet weak var practiceButton: UIButton!
    @IBOutlet weak var welcomeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        /*guard segue.destination is DealerGameViewController else {
            fatalError("Invalid segue destination \(segue.destination)")
        }*/
    }

}
