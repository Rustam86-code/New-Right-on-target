//
//  ColorViewControler.swift
//  New Right on target
//
//  Created by Rustam Tleubayev on 18.03.2022.
//

import UIKit

class ColorViewController: UIViewController {
    
    var game: Game<SecretColorValue>!
    var correctButtonTag: Int = 0
    
    @IBOutlet var hexLabel: UILabel!

    @IBOutlet var template1: UILabel!
    @IBOutlet var template2: UILabel!
    @IBOutlet var template3: UILabel!
    @IBOutlet var template4: UILabel!
   
    var buttounsCollection: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        game = (GameFactory.getColorGame() as! Game<SecretColorValue>)
        buttounsCollection = [template1, template2, template3, template4]
        updateScene()
    }
    
    private func updateScene () {
        let secretColorString = game.secretValue.value.getByHexString()
        updateColorSecretLabel(withText: secretColorString)
        updateButton(withRigthSecretValue: game.secretValue)
    }
    
    @IBAction func compareValue(sender: UIButton) {
        var userValue = game.secretValue
        userValue = Color(from: sender.backgroundColor!)
        game.calculateScore(secretValue: game.secretValue, userValue: userValue)
        if game.isGameEnded {
            showAlertWith(score: game.score)
            game.restartGame()
        } else {
            game.startNewRound()
        }
        updateScene()
    }
    
    private func updateColorSecretLabel(withText newHexColorText: String){
        hexLabel.text = "#\(newHexColorText)"
    }
    
    private func updateButton(withRigthSecretValue secretValue: SecretColorValue) {
        correctButtonTag = Array(1...4).randomElement()!
        buttounsCollection.forEach { button in
            if button.tag == correctButtonTag {
                button.backgroundColor = secretValue.value.getByUIColor()
            } else {
                var copySecretValueForButton = secretValue
                copySecretValueForButton.setRandomValue()
                button.backgroundColor = copySecretValueForButton.value.getByUIColor()
            }
            
        }
    }
    
    private func showAlertWith(score: Int){
        let alert = UIAlertController(title: "Game is over", message: "Your win is score \(score)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Restart game", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
    
//    @IBAction func hideCurrentScene() {self.dismiss(animated: true, completion: nil)}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

