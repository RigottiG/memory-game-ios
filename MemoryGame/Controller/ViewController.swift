//
//  ViewController.swift
//  MemoryGame
//
//  Created by Guilherme Gabriel Rigotti on 09/06/21.
//

import UIKit

class ViewController: UIViewController {
    var memoryGame: MemoryGame = MemoryGame.generateShuffledCards()
    @IBOutlet var buttons: [UIButton]!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func onResetPress(_ sender: UIButton) {
        restartGame()
    }

    @IBAction func onButtonPress(_ sender: UIButton) {
        let id = sender.tag

        if let card = memoryGame.cards.first(where: { card in card.id == id }) {
            memoryGame.selectCard(card: card)

            var image = UIImage(named: "Card")
            switch card.type {
            case .Witch:
                image = UIImage(named: "Card Bruxa")
            case .Mage:
                image = UIImage(named: "Card Mago")
            case .Dwarf:
                image = UIImage(named: "Card Anão")
            case .Knight:
                image = UIImage(named: "Card Cavaleiro")
            case .Elf:
                image = UIImage(named: "Card Elfa")
            }

            sender.setImage(image, for: .normal)
            UIView.transition(with: sender, duration: 0.3, options: .transitionFlipFromRight, animations: nil, completion: nil)
            updateCardButton()
            checkVictory()
        }
    }
}

extension ViewController {
    private func updateCardButton() {
        for button in buttons {
            if let card = memoryGame.cards.first(where: { $0.id == button.tag }) {
                if !card.isVisible && !card.wasMatched {
                    chooseWrongCard(button: button)
                } else {
                    chooseRightCard(button: button)
                }
            }
        }
    }

    private func resetButtons() {
        for button in buttons {
            button.isUserInteractionEnabled = true
            button.setImage(UIImage(named: "Card"), for: .normal)
        }
    }

    private func chooseWrongCard(button: UIButton) {
        button.isUserInteractionEnabled = true
        button.setImage(UIImage(named: "Card"), for: .normal)
        UIView.transition(with: button, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
    }

    private func chooseRightCard(button: UIButton) {
        button.isUserInteractionEnabled = false
    }


    private func restartGame() {
        memoryGame = MemoryGame.generateShuffledCards()
        resetButtons()
    }

    var playAgain: UIAlertAction {
        UIAlertAction(title: "Bacana, bora de novo", style: .default) { _ in
            self.restartGame()
        }
    }

    private func checkVictory() {
        if memoryGame.state == .Victory {
            alertVictory()
        }
    }

    private func alertVictory() {
        let alert = UIAlertController(title: "Boa, você terminou!", message: "Você precisou de \(memoryGame.attemptsQuantity) tentativas para finalizar o jogo da memória.", preferredStyle: .alert)

        alert.addAction(playAgain)
        present(alert, animated: true, completion: nil)
    }
}
