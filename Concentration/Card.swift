//
//  Card.swift
//  Concentration
//
//  Created by Riccardo Pfeiler on 26.08.21.
//

import Foundation

struct Card {
    
    var isFaceUp = false
    var isMatched = false
    let identidier: Int
    
    static var identifierFactory = 0
    
    static func getUiniqueIdentifier() -> Int {
        Card.identifierFactory += 1
        return identifierFactory
    }
    
    init(){
        self.identidier = Card.getUiniqueIdentifier()
    }
}
