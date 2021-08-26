//
//  ViewController.swift
//  Concentration
//
//  Created by Riccardo Pfeiler on 26.08.21.
//

import UIKit

class ViewController: UIViewController {

    lazy var game: Concentration = Concentration(numberOfPairOfCards: (cardButtons.count + 1) / 2)
    
    var flipCount = 0 {
        didSet{
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
        
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender){
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("chosen card was not in cardButtons.")
        }
    }
    
    func updateViewFromModel(){
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }
    
    func flipCard(withEmoji emoji: String, on button: UIButton){
        if button.currentTitle == emoji {

        } else {

        }
    }
    var emoji = [Int:String]()
    
    var emojiChoices = ["🙀","👻","🎃","👹","😈","🕷","🔪","🪓","⚰️","💉","🩸","🦠","☣️"]
    
    func emoji(for card: Card) -> String{
        if emoji[card.identidier] == nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identidier] = emojiChoices.remove(at: randomIndex)
        }
        return emoji[card.identidier] ?? "?"
    }


}

