//
//  MemoryGameTests.swift
//  MemoryGameTests
//
//  Created by Guilherme Gabriel Rigotti on 09/06/21.
//

import XCTest
@testable import MemoryGame

class MemoryGameTests: XCTestCase {
    var memoryGame: MemoryGame!


    override func setUp() {
        let card1: Card = Card(id: 1, type: .Dwarf)
        let card2: Card = Card(id: 2, type: .Mage)
        let card3: Card = Card(id: 3, type: .Elf)
        let card4: Card = Card(id: 4, type: .Knight)
        let card5: Card = Card(id: 5, type: .Witch)
        let card6: Card = Card(id: 6, type: .Dwarf)
        let card7: Card = Card(id: 7, type: .Mage)
        let card8: Card = Card(id: 8, type: .Elf)
        let card9: Card = Card(id: 9, type: .Knight)
        let card10: Card = Card(id: 10, type: .Witch)

        let cards: [Card] = [card1, card2, card3, card4, card5, card6, card7, card8,card9,card10]
        memoryGame = MemoryGame(cards: cards)
    }

    func test_shouldSelectCard() {
        let card1: Card = Card(id: 1, type: .Dwarf)
        memoryGame.selectCard(card: card1)

        XCTAssertEqual(card1.isVisible, true)
    }
}
