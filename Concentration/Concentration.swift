//
//  Concentration.swift
//  Concentration
//
//  Created by Riccardo Pfeiler on 26.08.21.
//

import Foundation

class Concentration {
    
    var cards = [Card]()
    
    func chooseCard(at index: Int){
        if cards[index].isFaceUp {
            cards[index].isFaceUp = false
        } else {
            cards[index].isFaceUp = true
        }
    }
    
    init(numberOfPairOfCards: Int) {
        for _ in 0..<numberOfPairOfCards {
            let card = Card()
            cards += [card, card] //card is struct, therefore gets copied, add pair of cards
        }
        //TODO: Shuffle the Cards
    }
}

