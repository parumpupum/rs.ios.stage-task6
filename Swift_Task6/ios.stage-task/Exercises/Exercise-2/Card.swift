import Foundation

protocol CardBaseCompatible: Hashable, Codable {
    var suit: Suit {get}
    var value: Value {get}
    var isTrump: Bool {get}

    func hash(into hasher: inout Hasher)
}

enum Suit: Int, CaseIterable, Codable {
    case clubs
    case spades
    case hearts
    case diamonds
}

enum Value: Int, CaseIterable, Codable {
    case six
    case seven
    case eight
    case nine
    case ten
    case jack
    case queen
    case king
    case ace
}

struct Card: CardBaseCompatible {
    let suit: Suit
    let value: Value
    var isTrump: Bool = false

    func hash(into hasher: inout Hasher) {

    }

    static func == (lhs: Self, rhs: Self) -> Bool {
        if lhs.suit == rhs.suit && lhs.value == rhs.value { return true }
        else { return false }
    }
}

extension Card {

    func checkIfCanBeat(card: Card) -> Bool {
        let firstCard = self, secondCard = card
        var answer = false
        
        if ((firstCard.isTrump && secondCard.isTrump) || (!firstCard.isTrump && !secondCard.isTrump)){
            let firstPower = Value.allCases.firstIndex(where: {$0 == firstCard.value})!
            let secondPower = Value.allCases.firstIndex(where: {$0 == secondCard.value})!
            
            if (firstPower > secondPower) { answer = true }
            else { answer = false }
        }
        if (firstCard.isTrump && !secondCard.isTrump){
            answer = true
        }
        if (!firstCard.isTrump && secondCard.isTrump){
            answer = false
        }
        
        return answer
        
    }
    
}
