//
//  ViewController.swift
//  Concentration3
//
//  Created by desperado on 2018/05/12.
//  Copyright © 2018 desperado. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private   lazy var game = Concentration3(numberOfPairsOfCards: numberOfPairsOfCards)
        var numberOfPairsOfCards: Int{
        return (cardButtons.count+1)/2
    }
    
    
    
    @IBOutlet private var cardButtons: [UIButton]!
    
    @IBOutlet private weak var flipCountLabel: UILabel!
    
    @IBOutlet private weak var Score: UILabel!
    
    @IBAction private func newGame(_ sender: UIButton) {
       
        game = Concentration3(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
        updateViewFromModel()
        emoji = [Card:String]()
       
    }
    
    @IBAction private func touchCard(_ sender: UIButton) {
        game.flipCount += 1
        if let cardNumber = cardButtons.index(of: sender){
            
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }
        else{
            print("chosen card was not in cardButtons")
        }
    }
    
    private func updateViewFromModel(){
        Score.text = "Score:\(game.score)"
        flipCountLabel.text = "Flips: \(game.flipCount)"
        for index in cardButtons.indices{
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUP{
                button.setTitle(emoji(for: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                
            }
            else{
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 0): #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
                
            }
        }
        
    }
    
    private var emojiChoices = ["🏓","🍎","🎃","🥊","😉","❣️","🍋","🍐","🥦"]
    private   var emoji =  [Card:String]()
    private  func emoji(for card: Card) -> String{
        if emoji[card] == nil, game.themeChoice.count > 0 {
            //let temp3 = game.themeChoice.count
           // var a = game.themeChoice.count
            let randomStringIndex = game.themeChoice.index(game.themeChoice.startIndex, offsetBy: game.themeChoice.count.arc4ramdom)
            emoji[card] = String(game.themeChoice.remove(at: randomStringIndex))
            print(randomStringIndex)
        }
    
        return emoji[card] ?? "?"
    }
}
extension Int  {
    var arc4ramdom: Int {
        if self > 0{
            return Int(arc4random_uniform(UInt32(self)))
        }else if self < 0{
            return -Int(arc4random_uniform(UInt32(abs(self))))
        }else{
            return 0
        }
    }
}
