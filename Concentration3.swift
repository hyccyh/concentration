//
//  Concentration3.swift
//  Concentration3
//
//  Created by desperado on 2018/05/13.
//  Copyright © 2018 desperado. All rights reserved.
//

import Foundation
class Concentration3
{
    
  private(set) var cards = [Card]()
  private(set)  var score = 0
    var flipCount = 0 
    //  private  var theme = [0:["🐶","🐱","🐭","🐹","🐰","🦊","🐻","🐯"],1:["⚽️","🏀","🥊","🏉","🎱","🏓","⛸","🚣‍♂️"],2:["😃","😋","😛","😝","😎","😏","🙃","😍"],3:["🍎","🍒","🥐","🧀","🍙","🍭","🥠","🌰"],4:["🚗","🚕","🚙","🚌","🚎","🏎","🚓","🚑"],5: ["🏳️‍🌈","🇩🇿","🇦🇩","🇦🇶","🇧🇩","🇨🇱","🇨🇰","🇨🇿"]]
    private  var theme = [0:"🐶🐱🐭🐹🐰🦊🐻🐯",1:"⚽️🏀🥊🏉🎱🏓⛸🚣‍♂️",2:"😃😋😛😝😎😏🙃😍",3:"🍎🍒🥐🧀🍙🍭🥠🌰",4:"🚗🚕🚙🚌🚎🏎🚓🚑",5: "🏳️‍🌈🇩🇿🇦🇩🇦🇶🇧🇩🇨🇱🇨🇰🇨🇿"]
    var themeChoice = String()
    
    private  func chooseRandomTheme(){
        let temp = Array(theme.keys)
        let themechoice = temp.count.arc4ramdom 
        themeChoice = theme[themechoice]!
    }
    private  var indexOfOneAndOnlyFaceupCard: Int?{
        get{
            var foundIndex: Int?
            for index in cards.indices{
                if cards[index].isFaceUP{
                    if foundIndex == nil {
                        foundIndex = index
                    }else{
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set{
            for index in cards.indices{
                cards[index].isFaceUP = (index == newValue)
            }
        }
    }
    
    func chooseCard(at index: Int){
        /*  if cards[index].isFaceUP{
         cards[index].isFaceUP = false
         }
         else{
         cards[index].isFaceUP = true
         }*/
        cards[index].fliped += 1
        if !cards[index].isMatched{
            if let matchIndex = indexOfOneAndOnlyFaceupCard, matchIndex != index{
                // check if cards match
                if cards[matchIndex] == cards[index]{
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                    score += 2
                } else {
                    if cards[matchIndex].fliped > 1 {
                        score -= 1
                    }
                    if cards[index].fliped > 1 {
                        score -= 1
                    }
                    
                }
                cards[index].isFaceUP = true
                //                indexOfOneAndOnlyFaceupCard = nil
                
            }else{
                // either no cards or 2 cards are face up
                //                for flipDownIndex in cards.indices{
                //                    cards[flipDownIndex].isFaceUP = false
                //                }
                //                cards[index].isFaceUP = true
                indexOfOneAndOnlyFaceupCard = index
                
            }
        }
        
    }
    init(numberOfPairsOfCards: Int){
        chooseRandomTheme()
        var initcards = [Card]()
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            initcards += [card,card]
         //  print("\(count)")
        }
        for _ in 0..<initcards.count {
            let randomIndex = Int(arc4random_uniform(UInt32(initcards.count)))
             cards += [initcards.remove(at: randomIndex)]
           // cards += [card]
           // print("\(index)")
        }
        //TODO: shuffle the cards
        //MARK:
    }
}
