//
//  Player.swift
//  DurakGame
//
//  Created by Дима Носко on 15.06.21.
//

import Foundation

protocol PlayerBaseCompatible {
    var hand: [Card]? { get set }
}

final class Player: PlayerBaseCompatible {
    var hand: [Card]?

    func checkIfCanTossWhenAttacking(card: Card) -> Bool {
        for cardInHand in hand!{
            if card.value == cardInHand.value{
                return true
            }
        }
        return false
    }

    func checkIfCanTossWhenTossing(table: [Card: Card]) -> Bool {
        for card in table{
            for cardInHand in hand!{
                if card.value.value == cardInHand.value{
                    return true
                }
                if card.key.value == cardInHand.value{
                    return true
                }
            }
        }
        return false
    }
}
