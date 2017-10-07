//
//  PracticeGameViewController.swift
//  Blackjack
//
//  Created by Korman Chen on 10/7/17.
//  Copyright © 2017 Korman Chen. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class PracticeGameViewController: UIViewController {
    
    let menuButton = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'PracticeGameScene.sks'
            if let scene = SKScene(fileNamed: "PracticeGameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                // Present the scene
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = false
            view.showsFPS = false
            view.showsNodeCount = false
            loadButtonUI()
        }
    }
    
    func loadButtonUI()
    {
        menuButton.setTitle("Menu", for: .normal)
        menuButton.setTitleColor(UIColor.white, for: .normal)
        menuButton.addTarget(self, action: #selector(quitGame), for: .touchUpInside)
        view?.addSubview(menuButton)
    }
    
    func quitGame()
    {
        dismiss(animated: true, completion: nil)
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
}
