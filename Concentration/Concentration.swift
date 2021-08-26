//
//  Concentration.swift
//  Concentration
//
//  Created by Riccardo Pfeiler on 26.08.21.
//

import Foundation

class Concentration {
    
    var flipCount = 0
    var score = 0 {
        didSet{
            if score < 0 {score = 0}
        }
    }
    var cards = [Card]()
    var mismatchedCards = [Card]()
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func chooseCard(at index: Int){
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                //check if cards match
                if cards[matchIndex].identidier == cards[index].identidier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                    score += 2
                }
                //check for mismatched cards, each mismatch results in a additive penalty of -1 each time a card is involved in a mismatch
                for card in mismatchedCards {
                    if cards[index].identidier == card.identidier && !cards[index].isMatched {
                            score -= 1
                        }
                    }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
                if !cards[index].isMatched{//cards mismatched
                    mismatchedCards.append(cards[index])
                }
                flipCount += 1
            } else {
                //either no cards or two cars are face up
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairOfCards: Int) {
        for _ in 0..<numberOfPairOfCards {
            let card = Card()
            cards += [card, card] //card is struct, therefore gets copied, add pair of cards
        }
        //TODO: Shuffle the Cards
        cards.shuffle()
    }
}

