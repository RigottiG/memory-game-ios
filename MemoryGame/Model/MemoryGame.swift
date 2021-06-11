//
// Created by Guilherme Gabriel Rigotti on 09/06/21.
//

import Foundation

class MemoryGame {
    var cards: [Card] = []

    private(set) var state: GameState = .Playing
    private(set) var matchesQuantity: Int = 0 {
        didSet {
            if matchesQuantity == 5 {
                state = .Victory
            }
        }
    }
    private(set) var attemptsQuantity: Int = 0
    private(set) var currentCardsSelected: [Card] = []

    init(cards: [Card]) {
        self.cards = cards
    }

    func selectCard(card: Card) {
        guard !card.isVisible && !card.wasMatched else { return }

        if currentCardsSelected.count == 2 {
            for card in currentCardsSelected {
                card.isVisible = false
            }

            currentCardsSelected.removeAll()
        }

        if !currentCardsSelected.isEmpty {
            checkIfMatches(card: card)
        }

        currentCardsSelected.append(card)
        card.isVisible = true

        
    }

    func checkIfMatches(card: Card) {
        let firstCardSelected = currentCardsSelected[0]

        if firstCardSelected.type == card.type {
            firstCardSelected.wasMatched = true
            card.wasMatched = true
            matchesQuantity += 1
        }
        
        attemptsQuantity += 1
    }
}

extension MemoryGame {
    class func generateShuffledCards() -> MemoryGame {
        var cards: [Card] = []
        var CardTypesArray: [CardTypes] = CardTypes.allCases

        for i in 1...5 {
            let randomIndex = Int.random(in: 0..<CardTypesArray.count)
            let selectedType = CardTypesArray.remove(at: randomIndex)

            cards.append(Card(id: i, type: selectedType))
        }

        for item in cards {
            let id = item.id + 5
            cards.append(Card(id: id, type: item.type))
        }

        return MemoryGame(cards: cards.shuffled())
    }
}
