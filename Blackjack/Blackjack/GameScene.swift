//
//  GameScene.swift
//  Blackjack
//
//  Created by Korman Chen on 10/1/17.
//  Copyright © 2017 Korman Chen. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var deck: SKSpriteNode = SKSpriteNode()
    
    override func didMove(to view: SKView) {
        
        deck = self.childNode(withName: "Deck") as! SKSpriteNode
    }
    
    func touchDown(atPoint pos : CGPoint) {
        
        if pos.y < 100
        {
            let someCard = SKSpriteNode(imageNamed: "cardSpadesA.png")
            someCard.position = CGPoint(x: pos.x, y: pos.y)
            self.addChild(someCard)
        }
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
