//
//  Game.swift
//  DurakGame
//
//  Created by Дима Носко on 16.06.21.
//

import Foundation

protocol GameCompatible {
    var players: [Player] { get set }
}

struct Game: GameCompatible {
    var players: [Player]
}

extension Game {

    func defineFirstAttackingPlayer(players: [Player]) -> Player? {
        var attackingPlayer = Player(), minValue = 9
        
        for player in players{
            for i in 0..<6{
                if player.hand?[i].isTrump == true{
                    let cardValue = Value.allCases.firstIndex(where: {$0 == player.hand?[i].value})!
                    if cardValue < minValue {
                        attackingPlayer = player
                        minValue = cardValue
                    }
                }
            }
        }
        
        return attackingPlayer
    }
}
