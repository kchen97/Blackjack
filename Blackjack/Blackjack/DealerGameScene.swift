//
//  GameScene.swift
//  Blackjack
//
//  Created by Korman Chen on 10/1/17.
//  Copyright © 2017 Korman Chen. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class DealerGameScene: SKScene {
    
    let swipeRightRec = UISwipeGestureRecognizer()
    let swipeLeftRec = UISwipeGestureRecognizer()
    let tapRec = UITapGestureRecognizer()
    var stateLabel = SKLabelNode(fontNamed: "Chalkduster")
    var player: Player = Player()
    var dealer: Player = Player()
    var game: Game = Game()
    
    override func didMove(to view: SKView) {

        game.deck.deckImage.position = CGPoint(x: frame.midX, y: frame.midY + 100)
        game.labelConfig(somePlayer: player, dealer: dealer)
        let firstCards = game.dealFirstCards(somePlayer: player, dealer: dealer)
        for node in firstCards {
            addChild(node)
        }
        
        swipeRightRec.addTarget(self, action: #selector(DealerGameScene.swipedRight)) // Initialize gestures
        swipeLeftRec.addTarget(self, action: #selector(DealerGameScene.reset))
        tapRec.addTarget(self, action: #selector(DealerGameScene.touchDown))
        
        swipeRightRec.direction = .right // Initialize label and recognizer properties
        swipeLeftRec.direction = .left
        tapRec.numberOfTapsRequired = 2
        stateLabel.text = String("Your Turn")
        stateLabel.position = CGPoint(x: frame.midX, y: frame.midY + 200)
        
        self.addChild(player.scoreLabel) // Add labels and all gesture recognizers
        self.addChild(dealer.scoreLabel)
        self.addChild(stateLabel)
        self.view!.addGestureRecognizer(swipeRightRec)
        self.view!.addGestureRecognizer(swipeLeftRec)
        self.view!.addGestureRecognizer(tapRec)
    }
    
    func touchDown() {
        if(player.getState()) {
            addToHandAndView(aPlayer: player, yOffSet: game.yOffSetPlayer)
        }
    }
   
    func addToHandAndView(aPlayer: Player, yOffSet: Double) {
        addChild(game.deal(somePlayer: aPlayer, nextCardOffset: aPlayer.nextCardOffSet, yOffSet: yOffSet))
    }
    
    func dealerTurn(score: Int) {
        if score > 21 {
            stateLabel.text = "Bust."
        }
        else if score == 21 {
            stateLabel.text = "You win!"
        }
        else {
            stateLabel.text = "Dealer Turn"
            while dealer.getScore() < score {
                addToHandAndView(aPlayer: dealer, yOffSet: game.yOffSetDealer)
            }
            
            stateLabel.text = game.computeWinner(playerScore: score, dealerScore: dealer.getScore())
        }
    }
    
    func reset() {
        if player.keepHand || player.getScore() >= 21 { //Remove all nodes and add back default nodes
            stateLabel.text = "Your Turn"
            player.emptyHand(deck: game.deck)
            dealer.emptyHand(deck: game.deck)
            self.removeAllChildren()
            self.addChild(player.scoreLabel)
            self.addChild(dealer.scoreLabel)
            self.addChild(stateLabel)
            
            let firstCards = game.dealFirstCards(somePlayer: player, dealer: dealer)
            for node in firstCards {
                addChild(node)
            }
        }
    }
    
    func swipedRight() {
        player.keepHand = true
    }
    
    override func update(_ currentTime: TimeInterval) {
        player.scoreLabel.text = String(player.getScore())
        dealer.scoreLabel.text = String(dealer.getScore())
        if !player.getState()
        {
            dealerTurn(score: player.getScore())
        }
    }
}
