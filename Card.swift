//
//  Card.swift
//  Concentration3
//
//  Created by desperado on 2018/05/13.
//  Copyright © 2018 desperado. All rights reserved.
//

import Foundation


struct Card: Hashable
    
{
    var hashValue: Int{return identifier}
    
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    
    var isFaceUP = false
    var isMatched = false
    private var identifier: Int
    var fliped = 0
    
    private static var identifierFactory = 0
    
    private static func getUniqueIdentifier() -> Int{
        identifierFactory += 1
        return identifierFactory
    }
    init(){
        self.identifier = Card.getUniqueIdentifier()
    }
}
