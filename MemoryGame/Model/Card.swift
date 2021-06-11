//
// Created by Guilherme Gabriel Rigotti on 09/06/21.
//

import Foundation

class Card {
    let id: Int
    let type: CardTypes

    var isVisible: Bool = false
    var wasMatched: Bool = false

    init(id: Int, type: CardTypes) {
        self.id = id
        self.type = type
    }
}
