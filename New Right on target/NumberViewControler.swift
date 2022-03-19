//
//  NumericViewControler.swift
//  New Right on target
//
//  Created by Rustam Tleubayev on 18.03.2022.
//

import Foundation
import UIKit

class NumberViewControler: UIViewController {
    
    var game: Game<SecretNumericValue>!
    
    @IBOutlet var slider: UISlider!
    @IBOutlet var secretValueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        game = (GameFactory.getNumericGame() as! Game<SecretNumericValue>)
        updateLabelWithSecretNumber(newText: String(game.secretValue.value))
    }
    
    @IBAction func checkNumber(){
        
        var userSecretValue = game.secretValue
        game.calculateScore(secretValue: game.secretValue, userValue: userSecretValue)
        if game.isGameEnded {
            showAlertWith(score: game.score)
            game.restartGame()
        } else {
            game.startNewRound()
        }
        updateLabelWithSecretNumber(newText: String(game.secretValue.value))
    }
    
    required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
    private func showAlertWith(score: Int){
        let alert = UIAlertController(
                                title: "Игра окончена",
                                message: "Вы заработали \(score) очков",
                                preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Начать заново", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
    }
    
    private func updateLabelWithSecretNumber(newText: String){
        secretValueLabel.text = newText
    }
}
