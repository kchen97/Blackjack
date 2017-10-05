//
//  Card.swift
//  Blackjack
//
//  Created by Korman Chen on 10/3/17.
//  Copyright © 2017 Korman Chen. All rights reserved.
//

import Foundation
import SpriteKit

class Card
{
    var value: Int
    var image: SKSpriteNode = SKSpriteNode()
    
    init(cardValue: Int, cardImage: SKSpriteNode)
    {
        self.image = cardImage
        self.value = cardValue % 13
        
        if value > 10 || value < 1
        {
            value = 10
        }
    }
}
