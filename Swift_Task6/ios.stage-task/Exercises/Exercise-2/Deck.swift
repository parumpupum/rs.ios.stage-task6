import Foundation

protocol DeckBaseCompatible: Codable {
    var cards: [Card] {get set}
    var type: DeckType {get}
    var total: Int {get}
    var trump: Suit? {get}
}

enum DeckType:Int, CaseIterable, Codable {
    case deck36 = 36
}

struct Deck: DeckBaseCompatible {

    //MARK: - Properties

    var cards = [Card]()
    var type: DeckType
    var trump: Suit?

    var total:Int {
        return type.rawValue
    }
}

extension Deck {

    init(with type: DeckType) {
        self.type = type
        let suits = Suit.allCases
        let values = Value.allCases
        cards = createDeck(suits: suits, values: values)
    }

    public func createDeck(suits:[Suit], values:[Value]) -> [Card] {
        
        var cards = [Card]()
        for suit in suits{
            for value in values{
                cards.append(Card(suit: suit, value: value))
            }
        }
        
        return cards
        
    }

    public mutating func shuffle() {
        var newDeck = cards
        cards.removeAll()
        
        while let newCard = newDeck.randomElement(){
            
            cards.append(newCard)
            let i = newDeck.firstIndex(of: newCard)!
            newDeck.remove(at: i)
            
        }
        
    }

    public mutating func defineTrump() {
        trump = cards.last?.suit
        
        for (index, card) in cards.enumerated(){
            if card.suit == trump{
                cards[index].isTrump = true
            }
        }
    }

    public mutating func initialCardsDealForPlayers(players: [Player]) {
        for i in 0..<players.count{
            var newHand = [Card]()
            for q in 1...6{
                newHand.append(cards.first!)
                cards.removeFirst()
            }
            players[i].hand = newHand
        }
    }
    
}

