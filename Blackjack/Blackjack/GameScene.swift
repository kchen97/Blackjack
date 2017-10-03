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
    
    let cardGenerator: randomCardGenerator = randomCardGenerator()
    let firstCardXSpawn = -250.00, cardYSpawnFixed = -355.00
    var nextCardOffset = 0.00
    var deck: SKSpriteNode = SKSpriteNode()
    var playerCards: SKSpriteNode = SKSpriteNode()
    
    override func didMove(to view: SKView) {
        
        deck = self.childNode(withName: "Deck") as! SKSpriteNode
    }
    
    func touchDown(atPoint pos : CGPoint) {
        
        var newCard = cardGenerator.generateCard()
        newCard.position = CGPoint(x: firstCardXSpawn + nextCardOffset, y: cardYSpawnFixed) //Make cards overlap correctly
        nextCardOffset += 75.00
        
        self.addChild(newCard)
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
